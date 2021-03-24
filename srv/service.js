const cds = require('@sap/cds');

module.exports = async srv => {

    const db = await cds.connect.to('db'), { Service } = db.entities;
    srv.before('CREATE', 'Service', async (req) => {
        req.data.CustomerMail = req.user.id;
    });

    srv.before('READ', 'Service', req => {
        console.log(JSON.stringify(req.user));
        req.query.where('CustomerMail =', req.user.id)
    }
    );


    // srv.on('loadServiceImages', async (req) => {
    //     req._.req.loggingContext.getTracer(__filename).info('Inside loadProductImages Handler')
    //     try {
    //         const fs = require("fs")
    //         const fileExists = require('fs').existsSync
    //         let services = await cds.run(SELECT.from(Service))
    //         for (let service of services) {
    //             let fileName = __dirname + `/images/${service.ServiceID}.jpg`
    //             if (fileExists(fileName)) {
    //                 let importData = fs.readFileSync(fileName)
    //                 await cds.run(INSERT.into(ServiceImages).columns(
    //                     'Service.ServiceID', 'imageType', 'image'
    //                 ).values(
    //                     service.ServiceID, 'image/jpeg', importData
    //                 ))
    //             }
    //         }
    //         return true
    //     } catch (error) {
    //         req._.req.loggingContext.getLogger('/Application/loadProductImages').error(error)
    //         return false
    //     }
    // });
}