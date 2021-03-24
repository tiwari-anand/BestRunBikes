using { sap.capire.dev as db } from '../db/schema';

service BestBikesAdminService @(requires: 'admin_best_bikes'){
    entity Service as projection on db.Service;
    entity Status as projection on db.Status;
    entity ServiceType as projection on db.ServiceType;
    entity BicycleType as projection on db.BicycleType;
    // entity ServiceImages as projection on db.ServiceImages;
}
