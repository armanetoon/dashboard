
class AppException implements Exception {
  final String message;

  AppException({this.message = 'خطای نامشخص'});
}

class GetAllPlanNotFoundExc implements Exception{
  final String message = "طرحی یافت نشد";
}

class ServerErrorExc implements Exception{
  final String message = "سرور مشکلی دارد";
}

class NewPlanFailureExc implements Exception{
  final String message = "ثبت طرح با مشکل مواجه شد";
}

class GetAllPlansNotFoundException implements Exception{
  final String message = "طرحی برای نمایش وجود ندارد";
}

class GetAllUserFailureExc implements Exception{
  final String message = "نمایش کاربران با مشکل مواجه شد";
}

class GetImageFailureExc implements Exception{
  final String message = "اپلود عکس با مشکل مواجه شد";
}
