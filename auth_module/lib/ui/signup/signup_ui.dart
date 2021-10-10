import 'package:auth_module/bloc/user_bloc.dart';
import 'package:auth_module/ui/signup/controller_signup.dart';
import 'package:auth_module/ui/signup/presenter_signup.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class SignUpUI extends StatefulWidget {
  const SignUpUI({ Key? key }) : super(key: key);

  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> implements SignUpContract {
  late final BlocUser bloc;
  late final ControllerSignUp _controllerSignup;
  
  @override
  void initState() { 
    super.initState();
    bloc = Modular.get<BlocUser>();
    _controllerSignup= ControllerSignUp(PresenterSignUp(this),bloc);
  }
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: SizedBox(
          child: Stack(
              children:  [
              Positioned(
                top: 0,
                child: RiseWaveTop(
                  height: size.height * .3,
                ),
              ),
               Positioned(
                 bottom: 0,
                 child: RiseWaveBottom(
                   height:  size.height * .3,
                 )),
                StreamBuilder<UserState>(
                  stream: bloc.state,
                  builder: (context, snapshot) {
                    return IgnorePointer(
                      ignoring: snapshot.data is LoadingUserState,
                      child: SizedBox(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButtonBorderUnilateralCircular(label: 'Login',left: true,
                           onTap: (){
                              Modular.to.pushReplacementNamed('/auth/');
                           },
                           ),
                              ),
                              const SizedBox(height: 30,),
                            Center(child: Text('Cadastre-se',style: Theme.of(context).textTheme.headline3,)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:12.0),
                              child: Form(
                                key: _controllerSignup.getFormKey,
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
                                               crossAxisAlignment: CrossAxisAlignment.end,
                                               children:[
                                                   TextFormFieldCustom(
                                                      label:  const Text('Email'),
                                                      validator: Validators.email,
                                                      onChanged: (text) => _controllerSignup.user[UserKeys.email] =text,
                                                      prefixIcon: const Icon(Icons.email),
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    FormField<bool>(
                                                      initialValue: false,
                                                      builder: (state) {
                                                        return TextFormFieldCustom(
                                                          label: const Text('Senha'),
                                                          validator: Validators.password,
                                                          onChanged: (text) => _controllerSignup.user[UserKeys.password] = text,
                                                          obscure: state.value!,
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
                                       snapshot.data is LoadingUserState ? const CircularProgressIndicator() : CircleButton(size: 50, icon: Icons.arrow_forward,
                                             onTap:_controllerSignup.create,)
                                        ],
                                      ),
                                    ),
                 
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                           
                
                          ],
                        ),
                      ),
                    );
                  }
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
  success() {
    Modular.to.pushReplacementNamed('/home/products',);
  }

 

  
}