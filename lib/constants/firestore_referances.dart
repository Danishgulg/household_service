import '../global/instances.dart';

const String myAppCol = 'MyAppCol';
const String providedServiceDoc = 'ProvidedServiceDoc';
const String providedServiceCol = 'ProvidedServiceCol';

// Common firebase references
var providedServiceColRef = fireStoreInstance
    .collection(myAppCol)
    .doc(providedServiceDoc)
    .collection(providedServiceCol);
