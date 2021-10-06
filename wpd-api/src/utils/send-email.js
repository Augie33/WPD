const sgMail = require('@sendgrid/mail')

sgMail.setApiKey(process.env.SENDGRID_API_KEY)

const sendCaseEmail = async ({email, subject,url}) =>  {

  await  sgMail.send({
        to: email,
        from: 'test@gmail.com',
        subject: subject,
        text: `Case link: ${url}`
    })
}


module.exports = {
    sendCaseEmail
}

