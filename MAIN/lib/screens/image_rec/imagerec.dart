/* /* import 'package:tflite/tflite.dart';
Interpreter model = await Interpreter.fromAsset("model.tflite");


String? res = await Tflite.loadModel(

  model: "assets/model.tflite",

  labels: "assets/labels.txt",

  numThreads: 1 // defaults to 1

);

var recognitions = await Tflite.runModelOnImage(

        path: tfResizedImage.path, 

        imageStd: 255.0, 

        numResults: 3, 

        threshold: 0.00001, 

        asynch: true    

 ); */
// create a list of 81 empty lists

import 'package:flutter/material.dart';
import 'dart:math' as math;



class ImageRec extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    List<Object> inputs = List<Object>.generate(81, (index) => []); 
    // fill in our pixel values and ensure that they're the right size 
      for (int i=0; i<81; i++)
          inputs[i] = images[i].reshape([34, 34, 1]);
      // initialize our outputs to 0
      Map<int, Object> outputs = 
      { 0: List<double>.filled(81 * 10, 0).reshape([81, 10]) };
      // run our model! The results will be written into 'outputs'
      model.runForMultipleInputs(inputs, outputs);

      List<List<dynamic>> outValues = List<List<dynamic>>.from(output[0]);
for (int i=0; i<outValues.length; i++) {
    // obtain maximum value in the currOutput
    List<double> currOutput = List<double>.from(outValues[i]);
    double maxVal = currOutput.reduce(math.max);
    // obtains the first idx where maxVal occurs
    int maxIdx = currOutput.indexWhere((el) => el == maxVal);
    // MORE CODE HERE...
}
  }
}


 */