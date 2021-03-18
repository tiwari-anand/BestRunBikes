const cds = require('@sap/cds');

module.exports = async srv => {

    const db = await cds.connect.to('db'), { Service } = db.entities;
    srv.before('CREATE', 'Service', async (req) => {
        req.data.CustomerNo = req.user.id;
    });

    srv.before('READ', 'Service', req =>
        req.query.where('CustomerNo =', req.user.id)
    );

}