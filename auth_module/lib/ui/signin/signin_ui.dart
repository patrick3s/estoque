
import 'package:auth_module/bloc/user_bloc.dart';
import 'package:auth_module/ui/signin/controller_signin.dart';
import 'package:auth_module/ui/signin/presenter_signin.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class SignInUI extends StatefulWidget {
  const SignInUI({Key? key}) : super(key: key);

  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> implements SignInContract{
  late final ControllerSignIn _controllerSignIn;
  late final BlocUser bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<BlocUser>();
    _controllerSignIn = ControllerSignIn(bloc,PresenterSignIn(this));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: RiseWaveTop(
                  height: size.height * .3,
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: RiseWaveBottom(
                    height: size.height * .3,
                  )),
              SizedBox(
                height: size.height,
                width: size.width,
                child: StreamBuilder<UserState>(
                  stream: bloc.state,
                  builder: (context, snapshot) {
                    return IgnorePointer(
                      ignoring: snapshot.data is LoadingUserState,
                      child: Form(
                        key: _controllerSignIn.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.headline3,
                            )),
                            const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: size.width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: IntrinsicHeight(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                 TextFormFieldCustom(
                                                  label:  const Text('Email'),
                                                  prefixIcon: const Icon(Icons.email),
                                                  validator: Validators.email,
                                                  onEdittingComplete:  _controllerSignIn.login,
                                                  onChanged: (text) => _controllerSignIn.user[UserKeys.email] = text,
                                                ),
                                                const SizedBox(height: 10,),
                                                FormField<bool>(
                                                  initialValue: false,
                                                  builder: (state) {
                                                    return TextFormFieldCustom(
                                                      label: const Text('Senha'),
                                                      obscure: state.value!,
                                                      onEdittingComplete:  _controllerSignIn.login,
                                                      validator: Validators.password,
                                                      onChanged: (text) => _controllerSignIn.user[UserKeys.password] = text,
                                                      prefixIcon: IconButton(
                                                          onPressed: () {
                                                            state.didChange(!state.value!);
                                                          },
                                                          icon:  Icon( state.value == false ? Icons.lock : Icons.lock_open)),
                                                    );
                                                  }
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                         snapshot.data is LoadingUserState ? const CircularProgressIndicator() : CircleButton(
                                                size: 50, icon: Icons.arrow_forward,
                                                onTap: _controllerSignIn.login,
                                                )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero),
                                      onPressed: _controllerSignIn.recoverPassword,
                                      child: const Text('Esqueci minha senha'))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextButtonBorderUnilateralCircular(
                              label: 'Registre-se',
                              left: false,
                              onTap: () {
                                Modular.to.pushReplacementNamed('signup');
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  @override
  failure(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.error,
        content: Text(message,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
        color: AppColors.white
      ),
      ))
    );
  }

  @override
  success({String? text}) {
    if(text != null){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(text,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
        color: AppColors.white
      ),
      ))
    );
    }else{
       Modular.to.pushNamed('/home/products',);
    }
     
  }
}
