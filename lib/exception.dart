
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

class GetAllUserNotFoundExc implements Exception{
  final String message = "کاربری برای نمایش وجود ندارد";
}

class DeletePlanExc implements Exception{
  final String message = "حذف با مشکل مواجه شده است";
}

class UpdateUserNotFoundExc implements Exception{
  final String message = "طرحی برای بروزرسانی یافت نشد";
}

class UpdateUserFailureExc implements Exception{
  final String message = "بروزرسانی با مشکل مواجه شد";
}

class GetInvestorPlanNotFoundExc implements Exception{
  final String message = "کاربر طرحی برای سرمایه گذاری ندارد";
}

class GetInvestorPlanExc implements Exception{
  final String message = "دریافت طرح های سرمایه گذاری شده با مشکل مواجه شد";
}