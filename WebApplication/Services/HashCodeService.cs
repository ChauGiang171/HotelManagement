using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication.Services
{
    public class HashCodeService
    {
        public String createRoomBookingCancelCode(int roomBookingID, String customerEmail)
        {

            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(roomBookingID+customerEmail);
            byte[] hashValue = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hashValue);
        }
    }
}