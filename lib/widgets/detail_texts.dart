import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailTexts extends StatelessWidget {
  const DetailTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.6,
      child: Column(
        children:[
          const SizedBox(
            height: 32,
          ),
          Text(
            'کاربرد محصول',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن '),
          const SizedBox(
            height: 32,
          ),
          Text(
            'بررسی بازار',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(text: 'قیمت فروش محصولات', context: context),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن '),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(text: 'تحلیل وضعیت بازار', context: context),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متنمتن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن'),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(text: 'میزان تولید داخل', context: context),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن'),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(text: 'نیاز کشور', context: context),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متنمتن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن'),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(
              text: 'ظرفیت اسمی واحد های فعال موجود', context: context),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن'),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(
              text: 'ظرفیت اسمی طرح های در دست اجرا', context: context),
          const Text(
              'متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن'),
          const SizedBox(
            height: 32,
          ),
          Text(
            'بررسی فنی طرح',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(
            height: 16,
          ),
          titleWithCircle(text: 'دارنده دانش فنی', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن'),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'مصرف سالانه حال های انرژی', context: context),
          const SizedBox(height: 16,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('آب:'),
              Text('برق:'),
              Text('سوخت:'),
              Text('نوع سوخت:'),
            ],),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'نوع تجهیزات مورد نیاز', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  '),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'نوع و میزان مواد اولیه عمده', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  '),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'عمده محل تامین مواد اولیه', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  '),
          const SizedBox(height: 32,),
          Text(
            'بررسی مالی طرح',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'سرمایه ثابت', context: context),
          const SizedBox(height: 16,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('عرضی:'),
              Text('ريالی:'),
              Text('مجموع:'),
            ],),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'سرمایه کل', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  '),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'سرمایه در گردش', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  '),
          const SizedBox(height: 16,),
          titleWithCircle(text: 'پیش بینی فروش سالیانه', context: context),
          const SizedBox(height: 16,),
          const Text('متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن متن  '),
          const SizedBox(height: 16,),
        ]
      ),
    );
  }
  Widget titleWithCircle(
      {required String text, required BuildContext context}) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.circle_fill,
          color: Colors.blue,
          size: 12,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
