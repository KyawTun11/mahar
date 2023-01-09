import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({
    Key? key,
    this.isLoading,
    required this.child,
  }) : super(key: key);
  bool? isLoading;
  Widget child;

  @override
  Widget build(BuildContext context) {
    if(isLoading == null){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else if (isLoading == false){
      return const Center(child: Text("Error"),);
    }else{
      return child;
    }
  }
}
