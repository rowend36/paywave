import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/presentation/pages/profile.dart';

const profileRoute = AppRoute(
    name: "Profile",
    icon: IconsaxOutline.user,
    iconActive: IconsaxBold.user,
    page: ProfilePage());
