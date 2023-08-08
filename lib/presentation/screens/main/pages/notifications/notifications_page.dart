import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/presentation/pages/notifications.dart';

const notificationsRoute = AppRoute(
    name: "Notifications",
    icon: IconsaxOutline.notification,
    iconActive: IconsaxBold.notification,
    page: Notifications());
