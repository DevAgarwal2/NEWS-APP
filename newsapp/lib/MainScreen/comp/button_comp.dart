import "package:flutter/material.dart";
class ButtonComp extends StatelessWidget {
   ButtonComp({super.key,required this.title,required this.ontap,required this.icon});
  String title;
  Function()? ontap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
   
      child: InkWell(
        focusColor: Colors.grey,
        onTap: ontap,
        child: Container(
          width: double.maxFinite,
          
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(icon,color: Colors.grey.shade700,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(title,style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20,),
           
              
            ],
          ),
        ),
      ),
    );
  }
}