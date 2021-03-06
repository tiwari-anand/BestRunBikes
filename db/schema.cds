namespace sap.capire.dev;

using {sap} from '@sap/cds/common';

entity ServicesCodeList : sap.common.CodeList {
    key code : String;
        name : String;
}

entity Status : ServicesCodeList {
    key code : String default 'NO';
}

entity ServiceType : ServicesCodeList {}
entity BicycleType : ServicesCodeList {}
entity Gears       : ServicesCodeList {}
entity Tyres       : ServicesCodeList {}
entity Body        : ServicesCodeList {}


entity Service {
    key ServiceID     : UUID;
        CustomerMail  : String(100)                @title : 'Customer EmailId';
        FullName      : String(100)                @title : 'Full Name';
        Description   : String;
        City          : String(100);
        Country       : String(100);
        PostalCode    : String(100);
        OrderNo       : String(100);
        serviceType   : Association to ServiceType @title : 'Service Type';
        bicycleType   : Association to BicycleType @title : 'Bicycle Type';
        purchaseDate  : Date                       @title : 'Purchased on';
        completedDate : Date                       @title : 'Completed Date';
        notes         : String                     @title : 'Notes';
        completed     : Association to Status      @title : 'Service Completed';
        gearProblem   : Association to Gears       @title : 'Gears';
        tyreProblem   : Association to Tyres       @title : 'Tyres';
        bodyProblem   : Association to Body        @title : 'Body';
}




// entity Logs{
//     key ID: UUID;
//     date :String(100);
//     data:String(5000);
// }
