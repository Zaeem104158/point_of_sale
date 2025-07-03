import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/core/service/database_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/notification_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_request_entity.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_bloc.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_event.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_state.dart';
import 'package:point_of_sale/src/shared/widgets/loader_widget.dart';

class NotificationPage extends StatefulWidget {
  final LoginResponseEntity login;

  const NotificationPage({super.key, required this.login});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late NotificationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<NotificationBloc>();
    _bloc.add(LoadNotifications(widget.login));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return Center(child: getIt<LoaderWidget>());
        } else if (state is NotificationLoaded) {
          final notifications = state.notifications;

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return _buildGlassCard(notification, isDark, context);
            },
          );
        } else if (state is NotificationError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildGlassCard(
    NotificationResponseEntity notification,
    bool isDark,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryTextColor = isDark ? AppColor.lightText : AppColor.darkText;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black54;
    final buttonColor = isDark
        ? Colors.white.withValues(alpha: 0.2)
        : Colors.black.withValues(alpha: 0.05);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassContainer.clearGlass(
        height: 200.h,
        width: double.infinity,
        borderRadius: BorderRadius.circular(24),
        borderWidth: 1.5,
        blur: 15,
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColor.lightBackground.withValues(alpha: 0.15),
                  AppColor.lightBackground.withValues(alpha: 0.05),
                ]
              : [
                  AppColor.accent.withValues(alpha: 0.15),
                  AppColor.accent.withValues(alpha: 0.25),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: isDark
              ? [
                  AppColor.lightBackground.withValues(alpha: 0.40),
                  AppColor.lightBackground.withValues(alpha: 0.10),
                ]
              : [
                  AppColor.primary.withValues(alpha: 0.40),
                  AppColor.primary.withValues(alpha: 0.10),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification Title
              Text(
                notification.asnNotLabel ?? "",
                style: textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                notification.asnNotDesc.toString(),
                style: textTheme.bodyMedium?.copyWith(
                  color: secondaryTextColor,
                ),
              ),

              const SizedBox(height: 8),

              // Creator and Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      notification.asnNotCreatedBy.toString(),
                      style: textTheme.bodySmall?.copyWith(
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Created at ${DateFormat("d MMMM, yyyy 'at' h:mma").format(notification.asnNotCreatedDate!.toLocal())}",
                      style: textTheme.bodySmall?.copyWith(
                        color: secondaryTextColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Mark as Read Button
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: primaryTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  onPressed: notification.asnNotStatus! == 0
                      ? () {
                          final store = getIt<ObjectBoxService>().store;
                          final loginResponseBox = store
                              .box<LoginResponseEntity>();
                          final userInfo = loginResponseBox.getAll();
                          context.read<NotificationBloc>().add(
                            ReadNotification(
                              ReadNotificationRequestEntity(
                                pComId: userInfo.first.comId,
                                pNotificationId: notification.asnNotId,
                              ),
                            ),
                          );
                          //    FancySnackbar.showSnackbar(
                          //   context,
                          //   snackBarType: FancySnackBarType.success,
                          //   title: "Successfull read notification",
                          //   message: "${notification.asnNotLabel} is readed.",
                          //   duration: 2,
                          // );
                        }
                      : null,
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: primaryTextColor,
                  ),
                  label: Text(
                    notification.asnNotStatus! == 0 ? "Mark as Read" : "Readed",
                    style: textTheme.labelLarge?.copyWith(
                      color: primaryTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
