# Architecture et Structuration du Projet Field Service

## Table des matières

1. [Structuration en unités de code](#structuration-en-unités-de-code)
2. [Structuration en tables](#structuration-en-tables)
3. [Bonnes pratiques de conception appliquées](#bonnes-pratiques-de-conception-appliquées)
4. [Règles de nommage](#règles-de-nommage)

---

## Structuration en unités de code

### Organisation par packages (équivalent aux packages Java)

L'application suit une architecture en couches clairement définie, organisée dans le package `lib/src/`. Chaque package représente un domaine de responsabilité spécifique :

```
lib/src/
├── common/              # Code partagé et réutilisable
├── localization/        # Gestion de l'internationalisation
├── models/             # Modèles de données
├── presentation/       # Interface utilisateur
├── repository/         # Accès aux données
├── routing/            # Gestion de la navigation
└── services/           # Services métier et techniques
```

### Principes de structuration

#### 1. **Séparation des responsabilités (Separation of Concerns)**

Chaque package a une responsabilité unique et bien définie :

- **`common/`** : Code partagé (exceptions, thème, utilitaires, configuration)
- **`models/`** : Structures de données (DO, DTO, Factories)
- **`repository/`** : Abstraction de l'accès aux données (local/remote)
- **`services/`** : Logique métier et services techniques
- **`presentation/`** : Interface utilisateur (vues, contrôleurs, widgets)
- **`routing/`** : Configuration et gestion du routage

#### 2. **Organisation par domaine métier**

Au sein de chaque package, les éléments sont organisés par domaine métier :

```
models/
├── do/
│   ├── intervention/
│   ├── comment/
│   ├── document/
│   ├── image/
│   ├── material/
│   ├── signature/
│   └── timesheet/
├── dto/
│   └── [même structure par domaine]
└── factory/
    └── [même structure par domaine]
```

#### 3. **Couches d'architecture (Clean Architecture)**

L'application suit une architecture en couches inspirée de Clean Architecture :

```
┌─────────────────────────────────────────┐
│  Presentation Layer                     │
│  (Views, Controllers, Widgets)          │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│  Service Layer                          │
│  (Business Logic, Applying Services)    │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│  Repository Layer                       │
│  (Data Access: Local/Remote)            │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│  Data Layer                             │
│  (DO, DTO, Database, API)               │
└─────────────────────────────────────────┘
```

### Classes de base et héritage

#### Pattern Template Method avec classes abstraites

L'application utilise des classes de base abstraites pour définir des contrats communs :

1. **`BaseLocalRepository<T, D>`** : Repository générique pour toutes les opérations CRUD locales
2. **`BaseRemoteRepository`** : Repository de base pour toutes les requêtes HTTP
3. **`BaseLocalService<...>`** : Service générique pour la gestion locale des entités
4. **`BaseFactory<Do, Dto, Companion>`** : Factory générique pour la conversion entre modèles
5. **`BaseDoColumns`** : Documentation des colonnes communes pour les tables

#### Exemple d'héritage typique

```dart
// Classe de base
abstract class BaseLocalRepository<T extends Table, D extends DataClass> {
  // Méthodes communes : getAll, getOneByLocalId, insertOne, etc.
}

// Implémentation spécifique
class InterventionLocalRepository extends BaseLocalRepository<$InterventionsTable, Intervention> {
  @override
  TableInfo<$InterventionsTable, Intervention> get table => db.interventions;
}
```

### Design Patterns utilisés

1. **Repository Pattern** : Abstraction de l'accès aux données
2. **Factory Pattern** : Conversion entre différents modèles (DO ↔ DTO)
3. **Provider Pattern** (Riverpod) : Gestion de l'état et injection de dépendances
4. **Template Method Pattern** : Classes de base définissant le squelette des opérations
5. **Singleton Pattern** : Pour les factories (ex: `InterventionFactory.instance`)

---

## Structuration en tables

### Architecture de la base de données

L'application utilise **Drift** (anciennement Moor) pour la gestion de la base de données SQLite locale. La structure suit les principes suivants :

#### 1. **Tables définies dans `app_database.dart`**

Toutes les tables sont déclarées dans la classe `AppDatabase` :

```dart
@DriftDatabase(
  tables: [
    Interventions,
    Comments,
    Documents,
    Images,
    Materials,
    Signatures,
    Timesheets,
  ],
)
class AppDatabase extends _$AppDatabase {
  // ...
}
```

#### 2. **Structure standardisée des tables DO (Data Objects)**

Chaque table suit un modèle standardisé défini dans `BaseDoColumns` :

- **`localId`** : Clé primaire locale (auto-increment) - Identifiant unique local
- **`id`** : ID du serveur (nullable) - Identifiant synchronisé avec le backend
- Colonnes spécifiques au domaine métier
- Colonnes de métadonnées : `createdAt`, `updatedAt`, `isSync`

#### 3. **Exemple de table : Interventions**

```dart
class Interventions extends Table {
  const Interventions();

  /// Clé primaire locale (auto-incrément)
  IntColumn get localId => integer().autoIncrement()();

  /// ID du serveur (nullable si pas encore synchronisé)
  TextColumn get id => text().nullable()();

  /// Colonnes métier
  TextColumn get titre => text()();
  TextColumn get dateStart => text()();
  // ... autres colonnes

  /// Métadonnées
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
}
```

### Stratégie de synchronisation

Les tables sont conçues pour supporter un mode **offline-first** :

1. **Identification double** : `localId` (toujours présent) et `id` (null jusqu'à synchronisation)
2. **Flag de synchronisation** : `isSync` indique si l'entité a été synchronisée avec le serveur
3. **Timestamps** : `createdAt` et `updatedAt` permettent le suivi des modifications

### Migration de schéma

La base de données gère les migrations via `MigrationStrategy` :

```dart
@override
MigrationStrategy get migration => MigrationStrategy(
  onCreate: (m) async {
    await m.createAll();
  },
  onUpgrade: (m, from, to) async {
    // Gestion des migrations entre versions
  },
);
```

### Relations entre tables

Bien que le projet n'utilise pas explicitement de clés étrangères dans Drift, les relations sont gérées conceptuellement :

- **Interventions** : Table principale
- **Comments**, **Documents**, **Images**, **Materials**, **Signatures**, **Timesheets** : Tables liées aux interventions (relation 1-N conceptuelle via `interventionId`)

---

## Bonnes pratiques de conception appliquées

### 1. **Clean Architecture**

L'application sépare clairement les préoccupations :

- ✅ **Indépendance des frameworks** : La logique métier ne dépend pas de Flutter
- ✅ **Testabilité** : Chaque couche peut être testée indépendamment
- ✅ **Indépendance de l'UI** : La logique métier est indépendante de l'interface
- ✅ **Indépendance de la base de données** : L'utilisation de repositories abstrait l'accès aux données

### 2. **SOLID Principles**

#### Single Responsibility Principle (SRP)
- Chaque classe a une responsabilité unique :
  - `InterventionLocalRepository` : Gestion locale des interventions
  - `InterventionRemoteRepository` : Communication avec l'API
  - `InterventionLocalService` : Logique métier pour les interventions locales

#### Open/Closed Principle (OCP)
- Les classes de base sont ouvertes à l'extension mais fermées à la modification
- Exemple : `BaseLocalRepository` peut être étendue sans être modifiée

#### Liskov Substitution Principle (LSP)
- Les sous-classes peuvent remplacer leurs classes de base sans casser le contrat
- Exemple : Tous les repositories locaux peuvent être utilisés comme `BaseLocalRepository`

#### Interface Segregation Principle (ISP)
- Les interfaces sont spécifiques et ne forcent pas les classes à implémenter des méthodes inutiles
- Les factories héritent uniquement de ce dont elles ont besoin

#### Dependency Inversion Principle (DIP)
- Les dépendances sont injectées via Riverpod
- Les services dépendent d'abstractions (repositories) plutôt que d'implémentations concrètes

### 3. **DRY (Don't Repeat Yourself)**

- **Classes de base** : Évite la duplication de code dans les repositories et services
- **Factories** : Centralise la logique de conversion entre modèles
- **Utilitaires communs** : Code partagé dans `common/utils/`

### 4. **Separation of Concerns**

Chaque package gère un aspect spécifique :

- **Models** : Structure des données uniquement
- **Repository** : Accès aux données uniquement
- **Services** : Logique métier uniquement
- **Presentation** : Interface utilisateur uniquement

### 5. **Dependency Injection**

L'application utilise **Riverpod** pour l'injection de dépendances :

```dart
@Riverpod(keepAlive: true)
InterventionLocalRepository interventionLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return InterventionLocalRepository(database);
}
```

Avantages :
- ✅ Testabilité facilitée (mock des dépendances)
- ✅ Gestion du cycle de vie automatique
- ✅ Résolution des dépendances au runtime

### 6. **Immutabilité**

L'application privilégie l'immuabilité :

- **Freezed** : Génère des classes immuables pour les DTOs
- **Drift DataClass** : Les objets DO sont immuables
- **`copyWith`** : Méthode pour créer de nouvelles instances modifiées

### 7. **Error Handling**

Gestion centralisée des exceptions :

- **`AppException`** : Exception de base de l'application
- **`RemoteException`** : Exception pour les erreurs réseau
- **Gestion dans `BaseRemoteRepository`** : Traitement uniforme des erreurs HTTP

### 8. **Code Generation**

Utilisation de générateurs de code pour :

- **Drift** : Génération des classes de table et requêtes
- **Freezed** : Génération des classes immuables avec `copyWith`
- **Riverpod** : Génération des providers
- **JSON Serializable** : Sérialisation/désérialisation JSON

Avantages :
- ✅ Réduction du code boilerplate
- ✅ Moins d'erreurs manuelles
- ✅ Cohérence du code

### 9. **Documentation du code**

Le code est documenté avec des commentaires Dart :

```dart
/// Classe de base générique pour tous les repositories locaux
/// 
/// Fournit les opérations CRUD de base pour toutes les tables de la base de données locale.
/// Chaque repository spécifique doit étendre cette classe et fournir la table correspondante.
abstract class BaseLocalRepository<T extends Table, D extends DataClass> {
  // ...
}
```

---

## Règles de nommage

### Conventions générales

L'application suit les conventions de nommage Dart/Flutter standard, alignées avec les bonnes pratiques du langage.

### 1. **Fichiers**

#### Convention : `snake_case.dart`

- Les noms de fichiers sont en minuscules avec des underscores
- Le nom du fichier reflète le contenu principal

**Exemples :**
```
intervention_local.repository.dart
base_remote.repository.dart
app_database.dart
sign_in.controller.dart
```

#### Suffixes par type

- **Repositories** : `*_local.repository.dart`, `*_remote.repository.dart`
- **Services** : `*_local.service.dart`, `*_remote.service.dart`
- **DTOs** : `*_dto.dart`
- **DO (Data Objects)** : `*_do.dart` (tables Drift)
- **Factories** : `*_factory.dart`
- **Controllers** : `*_controller.dart`
- **Views** : `*_view.dart`
- **Widgets** : `*_widget.dart` ou descriptif (`intervention_card.dart`)
- **Fichiers générés** : `*.g.dart`, `*.freezed.dart`

### 2. **Classes et Types**

#### Convention : `PascalCase`

- Première lettre en majuscule, chaque mot commence par une majuscule

**Exemples :**
```dart
class InterventionLocalRepository { }
class BaseRemoteRepository { }
class InterventionDto { }
class AppDatabase { }
```

#### Préfixes et suffixes

- **Repositories** : `*Repository` (ex: `InterventionLocalRepository`)
- **Services** : `*Service` (ex: `InterventionLocalService`)
- **DTOs** : `*Dto` (ex: `InterventionDto`)
- **DO (Tables)** : Nom au pluriel pour les tables (ex: `Interventions`)
- **DO (DataClass)** : Nom au singulier (ex: `Intervention`)
- **Factories** : `*Factory` (ex: `InterventionFactory`)
- **Controllers** : `*Controller` (ex: `SignInController`)
- **Views** : `*View` (ex: `HomeView`)
- **Exceptions** : `*Exception` (ex: `AppException`, `RemoteException`)

### 3. **Variables et paramètres**

#### Convention : `camelCase`

- Première lettre en minuscule, chaque mot suivant commence par une majuscule

**Exemples :**
```dart
final interventionLocalRepository = InterventionLocalRepository(database);
final appRouter = ref.watch(appRouterProvider);
String serverId;
int localId;
```

#### Conventions spécifiques

- **ID local** : `localId`
- **ID serveur** : `id` ou `serverId`
- **Flags booléens** : Commence par `is`, `has`, `can`, etc. (ex: `isSync`, `hasError`)
- **Collections** : Nom au pluriel (ex: `interventions`, `comments`)
- **Providers Riverpod** : Nom descriptif + `Provider` (ex: `appRouterProvider`)

### 4. **Constantes**

#### Convention : `lowerCamelCase` pour les constantes publiques, `_kPrefix` pour les privées

**Exemples :**
```dart
// Privées (commencent par _k)
const _kWhite = Color(0xFFFFFFFF);
const _kBlack = Color(0xFF000000);

// Publiques
const appTitle = 'Field Service';
```

### 5. **Packages et dossiers**

#### Convention : `snake_case` en minuscules

**Exemples :**
```
lib/src/
├── common/
├── models/
│   ├── do/
│   ├── dto/
│   └── factory/
├── repository/
│   ├── local/
│   └── remote/
└── presentation/
    ├── controller/
    ├── view/
    └── widget/
```

### 6. **Méthodes et fonctions**

#### Convention : `camelCase`

- Verbe d'action + nom descriptif

**Exemples :**
```dart
Future<List<Dto>> findAll() async { }
Future<Dto?> findById(int localId) async { }
Future<int> insertOrUpdate(Dto dto) async { }
```

#### Conventions spécifiques

- **CRUD** : `getAll`, `getOneByLocalId`, `insertOne`, `updateOne`, `deleteOne`
- **Conversion** : `toDomainObject`, `toDataTransfertObject`, `toCompanion`
- **Async** : Toutes les opérations asynchrones utilisent `async/await`

### 7. **Noms de tables (Database)**

#### Convention : PascalCase au pluriel pour les classes de table

**Exemples :**
```dart
class Interventions extends Table { }
class Comments extends Table { }
class Documents extends Table { }
```

#### Nommage des colonnes

- **snake_case** ou **camelCase** selon le contexte Dart
- Préfixes cohérents : `localId`, `id`, `createdAt`, `updatedAt`

### 8. **Providers Riverpod**

#### Convention : `camelCase` + suffixe `Provider`

**Exemples :**
```dart
@riverpod
GoRouter appRouter(Ref ref) { }  // Génère appRouterProvider

@Riverpod(keepAlive: true)
AppDatabase database(Ref _) => AppDatabase();  // Génère databaseProvider
```

### 9. **Routes**

#### Convention : `snake_case` en minuscules

**Exemples :**
```dart
enum Routes {
  signIn(path: '/sign-in', name: 'sign-in'),
  home(path: '/home', name: 'home'),
  intervention(path: '/intervention', name: 'intervention'),
}
```

### 10. **Résumé des conventions**

| Type | Convention | Exemple |
|------|-----------|---------|
| **Fichiers** | `snake_case.dart` | `intervention_local.repository.dart` |
| **Classes** | `PascalCase` | `InterventionLocalRepository` |
| **Variables** | `camelCase` | `localId`, `interventionRepository` |
| **Constantes privées** | `_kPrefix` | `_kWhite`, `_kBlack` |
| **Méthodes** | `camelCase` | `findAll()`, `insertOrUpdate()` |
| **Packages** | `snake_case` | `intervention/`, `local/` |
| **Tables** | `PascalCase` pluriel | `Interventions`, `Comments` |
| **Providers** | `camelCase + Provider` | `appRouterProvider` |
| **Routes** | `snake_case` | `/sign-in`, `/home` |

---

## Conclusion

L'architecture et la structuration du projet Field Service appliquent de manière cohérente les principes de Clean Architecture et les bonnes pratiques de développement Dart/Flutter. La séparation claire des responsabilités, l'utilisation de patterns de conception appropriés, et des conventions de nommage uniformes contribuent à maintenir un code lisible, maintenable et évolutif.

Cette organisation facilite :

- ✅ **L'évolution** : Ajout de nouvelles fonctionnalités sans impacter le code existant
- ✅ **Les tests** : Chaque couche peut être testée indépendamment
- ✅ **La maintenance** : Code organisé et facilement navigable
- ✅ **La collaboration** : Conventions claires pour les développeurs
- ✅ **La scalabilité** : Structure prête pour l'ajout de nouvelles entités et fonctionnalités

