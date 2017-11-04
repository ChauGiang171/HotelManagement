using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace WebApplication.Services
{
    public class SendMailService
    {
        public String toAddress { set; get; }
        public String subject { set; get; }
        public String body { set; get; }

        public void sendMail()
        {
            var fromAddress = new MailAddress("Seasidesouthhotel@gmail.com", "SEA SIDE SOUTH PARK HOTEL");
            var toAddress = new MailAddress(this.toAddress, "Customer");
            string fromPassword = "seasidesouthhotel123";
            string subject = this.subject;
            string body = this.body;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 20000
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }
    }
}