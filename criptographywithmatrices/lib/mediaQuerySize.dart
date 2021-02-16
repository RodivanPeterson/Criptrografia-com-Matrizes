import 'package:flutter/material.dart';

class MediaQuerySize {
  
  double setFontSize(double deviceData){
    if(deviceData<=200.0){
      return 17.0;
    } else {
      if (deviceData>=200.0 && deviceData<300.0) {
        return 21.0;
      } else {
        if (deviceData>=300.0 && deviceData<500.0) {
          return 35.0;
        } else {
          if (deviceData>=500.0 && deviceData<680.0) {
            return 45.0;
          } else {
            if (deviceData>=680.0 && deviceData<820.0) {
              return 55.0;
            } else {
              if (deviceData>=820.0 && deviceData<1000.0) {
                return 60.0;
              } else {
                return 65.0;
              }
            }
          }
        }
      }
    }
  }

  EdgeInsets setPadding(double deviceData){
    if(deviceData<=200.0){
      return EdgeInsets.only(top: 10);
    } else {
      if (deviceData>200.0 && deviceData<300.0) {
        return EdgeInsets.only(top: 15);
      } else {
        if (deviceData>=300.0 && deviceData<500.0) {
          return EdgeInsets.only(top: 20);
        } else {
          if (deviceData>=500.0 && deviceData<680.0) {
            return EdgeInsets.only(top: 25);
          } else {
            if (deviceData>=680.0 && deviceData<820.0) {
              return EdgeInsets.only(top: 27);
            } else {
              if (deviceData>=820.0 && deviceData<1000.0) {
                return EdgeInsets.only(top: 35);
              } else {
                return EdgeInsets.only(top: 40);
              }
            }
          }
        }
      }
    }
  }

  EdgeInsets setMargin(double deviceData){
    if(deviceData<=200.0){
      return EdgeInsets.all(10);
    } else {
      if (deviceData>200.0 && deviceData<300.0) {
        return EdgeInsets.all(15);
      } else {
        if (deviceData>=300.0 && deviceData<500.0) {
          return EdgeInsets.all(20);
        } else {
          if (deviceData>=500.0 && deviceData<680.0) {
            return EdgeInsets.all(25);
          } else {
            if (deviceData>=680.0 && deviceData<820.0) {
              return EdgeInsets.all(27);
            } else {
              if (deviceData>=820.0 && deviceData<1000.0) {
                return EdgeInsets.all(35);
              } else {
                return EdgeInsets.all(40);
              }
            }
          }
        }
      }
    }
  }

  double setTextFieldSize(double deviceData){
    if(deviceData<=220.0){
      return 40.0;
    } else {
      if (deviceData>220.0 && deviceData<300.0) {
        return 55.0;
      } else {
        if (deviceData>=300.0 && deviceData<500.0) {
          return 70.0;
        } else {
          if (deviceData>=500.0 && deviceData<680.0) {
            return 85.0;
          } else {
            if (deviceData>=680.0 && deviceData<820.0) {
              return 100.0;
            } else {
              if (deviceData>=820.0 && deviceData<1000.0) {
                return 115.0;
              } else {
                return 130.0;
              }
            }
          }
        }
      }
    }
  }

  double setBorderWidth(double deviceData) {
    if(deviceData<=220.0){
      return 2.0;
    } else {
      if (deviceData>220.0 && deviceData<300.0) {
        return 2.5;
      } else {
        if (deviceData>=300.0 && deviceData<500.0) {
          return 3.0;
        } else {
          if (deviceData>=500.0 && deviceData<680.0) {
            return 3.5;
          } else {
            if (deviceData>=680.0 && deviceData<820.0) {
              return 4.0;
            } else {
              if (deviceData>=820.0 && deviceData<1000.0) {
                return 4.5;
              } else {
                return 5.0;
              }
            }
          }
        }
      }
    }
  }
}