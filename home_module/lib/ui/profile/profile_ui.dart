import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/ui/profile/controller_profile.dart';
import 'package:home_module/ui/profile/presenter_profile.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({ Key? key }) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> implements ContractProfile {
  bool loading = true;
  late final ControllerProfile _controller;
  late final BlocUser bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocUser(Modular.get<IUsecaseUser>());
    _controller = ControllerProfile(PresenterProfile(this),bloc);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async{
      _controller.user = await AuthHelper.currentUser ?? {};
      setState(() {
        loading = false;
      });
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: loading ? const Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _controller.formKey,
            child: Column(
              children:  [
                TextFormFieldCustom(
                  initialValue: AuthHelper.getUser?.name ,
                  label: const Text('Nome'),
                  validator: Validators.mandatory,
                  onChanged: (text) => _controller.user[UserKeys.name] = text,
                ),
                 TextFormFieldCustom(
                  initialValue: AuthHelper.getUser?.email ,
                  label: const Text('Email'),
                  enabled: false,
                  onChanged: (text) => _controller.user[UserKeys.email] = text,
                ),
                FormField<bool>(
                  initialValue: false,
                  builder: (state) {
                    return state.value == true ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        const Text('Digite sua nova senha'),
                        const SizedBox(height: 10,),
                         TextFormFieldCustom(
                          validator: Validators.password,
                          label: const Text('Nova senha'),
                          onChanged: (text) => _controller.user[UserKeys.password] = text,
                        ),
                      ],
                    ) : ElevatedButton(onPressed: (){
                      state.didChange(true);
                    }, child:const  Text('Trocar senha'));
                  }
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<UserState>(
                    stream: bloc.state,
                    builder: (context, snapshot) {
                      if(snapshot.data is LoadingUserState) return const Center(child: CircularProgressIndicator(),);
                      return ElevatedButton(onPressed: _controller.update, child: const Text('Atualizar dados da conta'));
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  failure(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.error,
        content: Text(text,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: AppColors.white
        ),
        )));
  }

  @override
  success() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Operação realizada com sucesso',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: AppColors.white
        ),
        )));
  }
}