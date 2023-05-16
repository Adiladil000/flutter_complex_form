part of 'complex_form_view.dart';

class ComplexInherited extends InheritedWidget {
  ComplexInherited({
    super.key,
    required super.child,
    this.complexData,
  }) : emailController = TextEditingController(text: complexData?.email);

  final ComplexData? complexData;
  final TextEditingController nameController = TextEditingController(text: 'HA777');
  final TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  @override
  bool updateShouldNotify(covariant ComplexInherited oldWidget) {
    return oldWidget.complexData != complexData;
  }

  ComplexData? controllerAndReturn() {
    if (fromKey.currentState?.validate() ?? false) {
      return ComplexData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneController.text,
      );
    }
    return null;
  }

  static ComplexInherited of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ComplexInherited>();
    assert(result != null, 'No ComplexInherited found in context');
    return result!;
  }
}
