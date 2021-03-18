namespace sap.capire.dev;
using { sap } from '@sap/cds/common';

entity ServicesCodeList : sap.common.CodeList {
 key code : String;
 name : String;
}

entity Status: ServicesCodeList{
    key code: String default 'NO';
}

entity ServiceType: ServicesCodeList{}

entity BicycleType : ServicesCodeList {}


entity Service {
    key ServiceID : UUID;
    CustomerMail :  String(100)   @title  : 'Customer EmailId';
    FullName : String(100) @title : 'Full Name';
    City : String(100);
    Country : String(100);
    Pincode : String(100);
    OrderNo :String(100);
    serviceType : Association to ServiceType  @title  : 'Service Type';
    bicycleType : Association to BicycleType  @title  : 'Bicycle Type';
    purchaseDate : String @title  : 'Purchased on';
    completedDate : String @title  : 'Completed Date';
    notes : String @title : 'Notes';
    completed : Association to Status @title : 'Service Completed';
}

// entity Logs{
//     key ID: UUID;
//     date :String(100);
//     data:String(5000);
// }
