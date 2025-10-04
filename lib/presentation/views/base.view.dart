// views/base.view.dart
import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/models/dto/feedback_state.dart';
import 'package:arkup_edoo/presentation/widgets/timer.widget.dart';
import 'package:arkup_edoo/repository/secure_storage.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:arkup_edoo/presentation/controller/timer.controller.dart';
import 'package:arkup_edoo/presentation/widgets/dialogs/logout_dialog.dart';

abstract class BaseScreen<T> extends ConsumerStatefulWidget {
  const BaseScreen({super.key});

  /// Optionnel : fournir un état (AsyncValue<T>) pour que BaseScreen le gère automatiquement
  AsyncValue<T>? buildState(WidgetRef ref) => null;

  /// Si `buildState()` retourne un AsyncValue, cette méthode est obligatoire
  Widget buildSuccess(BuildContext context, WidgetRef ref, T data) =>
      throw UnimplementedError('buildSuccess must be implemented');

  /// Sinon, on doit surcharger cette méthode pour afficher le body directement
  Widget buildBody(BuildContext context, WidgetRef ref) =>
      throw UnimplementedError('buildBody must be implemented');

  /// Optionnel
  Widget buildLoading(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
  Widget buildError(BuildContext context, Object error) => Center(
    child: Text("Erreur : $error", style: const TextStyle(color: Colors.red)),
  );

  /// Scaffold de base
  static Widget baseScaffoldView({
    required WidgetRef ref,
    required BuildContext context,
    bool withAppbar = true,
    bool withHeader = false,
    bool withPadding = true,
    String? headerTitle,
    bool canGoBack = false,
    bool canSwitch = false,
    VoidCallback? onSwitchLeft,
    VoidCallback? onSwitchRight,
    required Widget body,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    Widget? drawer,
    bool resizeToAvoidBottomInset = true,
    bool useSafeArea = true,
    Future<void> Function()? onRefresh
  }) {
    return Stack(
      children: [
        Scaffold(
          appBar: withAppbar ? _buildMainAppBar(ref, context) : null,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          drawer: drawer,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          extendBodyBehindAppBar: false,
          body: RefreshIndicator(
            onRefresh: onRefresh ?? () async {},
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: ThemeColors.background,
                child:
                    useSafeArea
                        ? SafeArea(
                          child: _buildContent(
                            context,
                            withHeader,
                            withPadding,
                            headerTitle,
                            body,
                            canGoBack,
                            canSwitch,
                            onSwitchLeft,
                            onSwitchRight,
                          ),
                        )
                        : _buildContent(
                          context,
                          withHeader,
                          withPadding,
                          headerTitle,
                          body,
                          canGoBack,
                          canSwitch,
                          onSwitchLeft,
                          onSwitchRight,
                        ),
              ),
            ),
          ),
        ),
        const TimerWidget(),
      ],
    );
  }

  static PreferredSizeWidget _buildMainAppBar(
    WidgetRef ref,
    BuildContext context,
  ) {
    final baseController = ref.read(snackbarStateProvider.notifier);
    final connectionStatus = ref.watch(connectionStatusProvider);

    final isConnected = connectionStatus.maybeWhen(
      data: (value) => value,
      orElse: () => true, // Par défaut "connecté"
    );

    return AppBar(
      automaticallyImplyLeading: false,
      leading: null,
      title: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isConnected
                  ? ThemeColors.turquoise.withValues(alpha: 0.1)
                  : ThemeColors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              // Icons.circle,
              isConnected ? Icons.circle : Icons.wifi_off_rounded,
              size: 12,
              color: isConnected ? ThemeColors.turquoise : ThemeColors.red,
            ),
            const SizedBox(width: 8),
            Text(
              isConnected ? "En ligne" : "Hors ligne",
              style: bodyS.copyWith(
                color: isConnected ? ThemeColors.turquoise : ThemeColors.red,
              ),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () async {
            final bool? shouldLogout = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return const LogoutDialog();
              },
            );

            if (shouldLogout == true) {
              final storage = ref.read(secureStorageProvider);
              await storage.deleteTokens();
              ref.read(timerNotifierProvider.notifier).stopTimer();

              if (context.mounted) {
                context.go(Routes.login);
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.power_settings_new_outlined,
                  color: ThemeColors.gray,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                  "Se déconnecter",
                  style: bodyM.copyWith(color: ThemeColors.gray),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildContent(
    BuildContext context,
    bool withHeader,
    bool withPadding,
    String? headerTitle,
    Widget body,
    bool canGoBack,
    bool canSwitch,
    VoidCallback? onSwitchLeft,
    VoidCallback? onSwitchRight,
  ) {
    if (!withHeader) return body;

    return Column(
      children: [
        AppBar(
          backgroundColor: ThemeColors.background,
          title:
              headerTitle != null
                  ? Text(
                    headerTitle,
                    style: title3.copyWith(fontWeight: FontWeight.w700),
                  )
                  : null,
          leading:
              canGoBack
                  ? InkWell(
                    onTap: () {
                      if (context.canPop()) context.pop();
                    },
                    child: Icon(Icons.arrow_back, color: ThemeColors.gray),
                  )
                  : null,
          actions:
              canSwitch
                  ? [
                    InkWell(
                      onTap: onSwitchLeft,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: ThemeColors.violet,
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: onSwitchRight,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ThemeColors.violet,
                      ),
                    ),
                    SizedBox(width: 10),
                  ]
                  : null,
        ),
        Expanded(
          child:
              withPadding
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: body,
                  )
                  : body,
        ),
      ],
    );
  }

  @protected
  void onInit(WidgetRef ref) {}

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInit(ref);
    });
  }

  bool _isLoadingVisible = false;

  void _showLoading(String? message) {
    if (!mounted || _isLoadingVisible) return;

    _isLoadingVisible = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true, // 🔑 important
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  if (message != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ),
    ).then((_) {
      // Si quelqu’un ferme le dialog autrement, on remet le flag à false
      _isLoadingVisible = false;
    });
  }

  void _hideLoading() {
    if (!mounted) return;
    if (_isLoadingVisible) {
      // Ne ferme que le dialog (pas la page)
      Navigator.of(context, rootNavigator: true).pop();
      _isLoadingVisible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Utilisez listenManual pour un contrôle plus fin
    ref.listen<ErrorState>(errorStateProvider, (previous, next) {
      if (next.show &&
          (previous == null ||
              !previous.show ||
              previous.message != next.message)) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
        // Réinitialise immédiatement l'état
        ref.read(errorStateProvider.notifier).state = const ErrorState(
          show: false,
          message: "",
        );
      }
    });

    ref.listen<SnackbarState>(snackbarStateProvider, (previous, next) {
      if (next.show &&
          (previous == null ||
              !previous.show ||
              previous.message != next.message)) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: next.isError ? Colors.red : Colors.green,
          ),
        );
        // Réinitialise immédiatement l'état
        ref.read(snackbarStateProvider.notifier).state = const SnackbarState();
      }
    });

    ref.listen<LoadingState>(loadingStateProvider, (prev, next) {
      if (prev?.show == next.show && prev?.message == next.message) return;

      if (next.show) {
        _showLoading(next.message);
      } else {
        _hideLoading();
      }
    });

    final state = widget.buildState(ref);
    if (state != null) {
      return state.when(
        data: (data) => widget.buildSuccess(context, ref, data),
        loading: () => widget.buildLoading(context),
        error: (e, _) => widget.buildError(context, e),
      );
    } else {
      return widget.buildBody(context, ref);
    }
  }
}
