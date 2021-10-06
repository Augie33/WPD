const sgMail = require('@sendgrid/mail');


sgMail.setApiKey(process.env.SENDGRID_API_KEY);

const sendCaseEmail =  async ({email, title, url}) => {

    const msg = {
        to: email,
        from: 'dmakwt1@gmail.com', // Use the email address or domain you verified above
        subject: title,
        text: `Case: ${url}`,
      };
      
     await sgMail.send(msg);
}


module.exports = {
    sendCaseEmail
}

