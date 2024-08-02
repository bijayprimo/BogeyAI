// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';

class CustomMarkdownReader extends StatefulWidget {
  const CustomMarkdownReader({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomMarkdownReader> createState() => _CustomMarkdownReaderState();
}

class _CustomMarkdownReaderState extends State<CustomMarkdownReader> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MarkdownBody(
        styleSheet: MarkdownStyleSheet(
          p: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Barlow Condensed'),
          h1: TextStyle(
              color: Colors.green,
              fontSize: 24,
              fontFamily: 'Barlow Condensed'),
          h2: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Barlow Condensed'),
          strong:
              TextStyle(color: Colors.green, fontFamily: 'Barlow Condensed'),
        ),
        data:
            "**Disclaimer**: *This differential diagnosis was drafted by a large language model fine-tuned on complex diagnostic cases curated by the Maslow AI Team. The following diagnoses are options that a clinician may want to consider and investigate but should never replace a clinician's judgment.*\n\n---\n\nA 65-year-old woman with a history of diabetes and hyperlipidemia presents with acute-onset chest pain and diaphoresis, found to have hyperacute T-waves without ST elevation. Considering this clinical presentation, let's conduct a comprehensive review before providing the most likely diagnosis and an expanded list of potential conditions.\n\n**Clinical Presentation Review**: The patient's age, past medical history of diabetes, and hyperlipidemia significantly increase her risk for cardiovascular disease. Acute-onset chest pain coupled with diaphoresis strongly suggests a cardiac event. The presence of hyperacute T-waves without ST elevation in the electrocardiogram (ECG) adds a layer of complexity to her presentation. Hyperacute T-waves can be an early sign of myocardial infarction before ST elevations become apparent. However, this finding can also be seen in other conditions.\n\n**Most Likely Diagnosis**: Given the clinical context - a 65-year-old woman with risk factors for cardiovascular disease presenting with acute chest pain and diaphoresis - the most likely diagnosis is **Acute Coronary Syndrome (ACS) without ST-segment elevation**. This encompasses both Non-ST Elevation Myocardial Infarction (NSTEMI) and unstable angina.\n\n**Expanded Differential Diagnosis List**:\n\n1. **Acute Coronary Syndrome (ACS)**: As discussed, her symptoms and ECG findings could represent an early phase of ACS, particularly NSTEMI or unstable angina.\n\n2. **Acute Myocardial Infarction (AMI)**: Though ST elevations are not present, hyperacute T-waves may precede them, indicating an evolving AMI.\n\n3. **Coronary vasospasm (Prinzmetal's angina)**: This condition can cause transient ischemic changes on the ECG, including hyperacute T-waves, due to temporary constriction of coronary arteries.\n\n4. **Pericarditis**: While chest pain in pericarditis is often positional and relieved by sitting up, early changes in pericarditis can sometimes mimic ischemic ECG changes.\n\n5. **Pulmonary embolism (PE)**: In a patient presenting with acute chest pain, particularly with risk factors for thrombosis such as hyperlipidemia and possibly immobility, PE should be considered. ECG changes can be nonspecific but occasionally may mimic ischemic changes.\n\n6. **Aortic dissection**: Though more commonly associated with mediate tearing chest pain radiating to the back, early subtle ECG changes can sometimes be seen.\n\n7. **Hyperkalemia**: Can cause a variety of ECG changes, including those that may mimic ischemic changes, especially in a patient with diabetes who may be at risk due to renal impairment or medications.\n\n**Conclusion**: A thorough clinical evaluation including serial ECGs, cardiac biomarkers, and possibly further imaging studies like echocardiography or coronary angiography, as indicated, is imperative to narrow down this differential diagnosis. Considering the patient's diabetes and hyperlipidemia, close attention should be paid to cardiovascular risk reduction in the long-term management plan. Multi-disciplinary care involving cardiology, endocrinology, and possibly other specialties is recommended to provide comprehensive care for this patient.",
      ),
    );
  }
}
