const cds = require('@sap/cds');

module.exports = async srv => {

    const db = await cds.connect.to('db'), { Service } = db.entities;
    srv.before('CREATE', 'Service', async (req) => {
        req.data.CustomerMail = req.user.id;
    });

    srv.before('READ', 'Service', req =>
    {
        console.log(JSON.stringify(req.user));
        req.query.where('CustomerMail =', req.user.id)}
    );
}