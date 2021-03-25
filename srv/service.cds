using {sap.capire.dev as db} from '../db/schema';

service BestBikesService @(requires : 'authenticated-user') {
    entity Service       as projection on db.Service;
    entity Status        as projection on db.Status;
    entity ServiceType   as projection on db.ServiceType;
    entity BicycleType   as projection on db.BicycleType;

    // entity ServiceImages as projection on db.ServiceImages {
    //     * , Service : redirected to Service
    // };

    // function loadServiceImages() returns Boolean;
}

annotate BestBikesService.Service with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Service',
        TypeNamePlural : 'Service Entries',
        // ImageUrl       : imageUrl,
        Title          : {Value : serviceType_code},
        Description    : {Value : FullName}
    },
    SelectionFields  : [
    Country,
    serviceType_code,
    bicycleType_code,
    completed_code
    ],
    LineItem         : [
    {
        Value : FullName,
        Label : 'Customer Name'
    },
    {
        Value : serviceType.name,
        Label : 'Service Type'
    },
    {
        Value : bicycleType.name,
        Label : 'Bicycle Type'
    },
    {Value : City},
    {Value : completed.name},
    // {
    //     $Type             : 'UI.DataField',
    //     Value             : imageUrl,
    //     ![@UI.Importance] : #High
    // }
    ],
    Facets           : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Service Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Main',
            Label  : 'Details'
        }]
    },
    {
        $Type  : 'UI.CollectionFacet',
        Label  : 'Problem Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Secondary'
        }]
    }],
    FieldGroup #Main : {Data : [
    {
        Value : Description,
        Label : 'Description'
    },
    {
        Value : City,
        Label : 'City'
    },
    {
        Value : Country,
        Label : 'Country'
    },
    {
        Value : PostalCode,
        Label : 'Postal Code'
    },
    {
        Value : serviceType_code,
        Label : 'Service Type'
    },
    {Value : purchaseDate},
    {
        Value : bicycleType_code,
        Label : 'Bicycle Type'
    }
    ]},
    FieldGroup #Secondary : {Data : [
    {
        Value : gearProblem_code,
        Label : 'Gear related problems'
    },
    {
        Value : tyreProblem_code,
        Label : 'Tyre related problems'
    },
    {
        Value : bodyProblem_code,
        Label : 'Body related problems'
    }
    ]}
});



annotate BestBikesService.Service with {
    serviceType @Common : {
        Text            : serviceType.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
    bicycleType @Common : {
        Text            : bicycleType.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
    completed   @Common : {
        Text            : completed.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
    gearProblem   @Common : {
        Text            : gearProblem.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
    tyreProblem   @Common : {
        Text            : tyreProblem.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
    bodyProblem   @Common : {
        Text            : bodyProblem.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
};

annotate BestBikesService.ServiceType with {
    code @UI.Hidden  @Common : {
        Text            : name,
        TextArrangement : #TextOnly
    };
    name @title :              'ServiceType';
};

annotate BestBikesService.BicycleType with {
    code @UI.Hidden  @Common : {
        Text            : name,
        TextArrangement : #TextOnly
    };
    name @title :              'BicycleType';
};

annotate BestBikesService.Status with {
    code @UI.Hidden  @Common : {
        Text            : name,
        TextArrangement : #TextOnly
    };
    name @title :              'Service Completed';
};

annotate BestBikesService.Gears with {
    code @UI.Hidden  @Common : {
        Text            : name,
        TextArrangement : #TextOnly
    };
    name @title :              'Gear related problems';
};

annotate BestBikesService.Tyres with {
    code @UI.Hidden  @Common : {
        Text            : name,
        TextArrangement : #TextOnly
    };
    name @title :              'Tyres related problems';
};

annotate BestBikesService.Body with {
    code @UI.Hidden  @Common : {
        Text            : name,
        TextArrangement : #TextOnly
    };
    name @title :              'Body related problems';
};