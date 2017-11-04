using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication.Entities;
using WebApplication.Services;
using System.Security.Cryptography;

namespace WebApplication.Controllers
{
    public class RoomBookingsController : Controller
    {
        private HotelManagementDAO db = new HotelManagementDAO();

        // GET: RoomBookings
        public ActionResult Index()
        {
            var roomBookings = db.RoomBookings.Include(r => r.CustomerTV).Include(r => r.Employee);
            return View(roomBookings.ToList());
        }

        // GET: RoomBookings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomBooking roomBooking = db.RoomBookings.Find(id);
            if (roomBooking == null)
            {
                return HttpNotFound();
            }
            return View(roomBooking);
        }

        // GET: RoomBookings/Create
        public ActionResult Create()
        {
            ViewBag.CustomerID = new SelectList(db.CustomerTVs, "CustomerID", "Name");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name");
            return View();
        }

        // POST: RoomBookings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RoomBookingID,CustomerID,Person,RoomID,Name,Phone,Email,CheckinDate,CheckoutDate,EmployeeID")] RoomBooking roomBooking)
        {
            if (ModelState.IsValid)
            {
                db.RoomBookings.Add(roomBooking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerID = new SelectList(db.CustomerTVs, "CustomerID", "Name", roomBooking.CustomerID);
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name", roomBooking.EmployeeID);
         
            return View(roomBooking);
        }

        [HttpPost]

        public ActionResult CreateJSON(RoomBooking roomBooking)

        {
            /*
            int RoomBookingID, int CustomerID, int Person, String RoomID,
            string Name, string Phone, string Email, string CheckinDate, string CheckoutDate, string EmployeeID
           
            RoomBooking roomBooking = new RoomBooking();
            roomBooking.RoomBookingID = RoomBookingID;
            roomBooking.CustomerID = CustomerID;
            roomBooking.Person = Person;
            roomBooking.RoomID = RoomID;
            roomBooking.Name = Name;
            roomBooking.Phone = Phone;
            roomBooking.Email = Email;
            roomBooking.CheckinDate = DateTime.Parse(CheckinDate);
            roomBooking.CheckoutDate = DateTime.Parse(CheckoutDate);
            roomBooking.EmployeeID = EmployeeID;
            */
          
            System.Diagnostics.Debug.WriteLine(roomBooking.Person);
            System.Diagnostics.Debug.WriteLine(roomBooking.CheckoutDate);

            try
            {
                db.RoomBookings.Add(roomBooking);
                db.SaveChanges();
                SendMailService mailService = new SendMailService();
                mailService.toAddress = roomBooking.Email;
                mailService.body = "ROOM BOOKING INFORMATIION\n"+ "CustomerName: " + roomBooking.Name + "\n" + "Phone:" + roomBooking.Phone + "\n" + "RoomBookingID for Customer: " + roomBooking.RoomBookingID + "\n"
									+ "Person:" +roomBooking.Person + "\n" + "CheckIn:" + roomBooking.CheckinDate + "\n" + "CheckOut:" + roomBooking.CheckoutDate;
                mailService.subject = "RoomBooking Information";
                mailService.sendMail();
                return Json(new { status = true, roomBookingID = roomBooking.RoomBookingID}, JsonRequestBehavior.AllowGet);
            }catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
               
                return Json(new { status = false }, JsonRequestBehavior.AllowGet);
            }
          
        }

        // GET: RoomBookings/CancelReservedRoom/id
        [HttpGet]
        public ActionResult CancelReservedRoom(string roomBookingID)
        {
            try
            {
                int bookingID = Int32.Parse(roomBookingID);
                RoomBooking roomBooking = db.RoomBookings.Where(x => x.RoomBookingID.Equals(bookingID)).Single();
                if (roomBooking == null)
                {
                    return Json(new { Status = false }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    SendMailService mailService = new SendMailService();
                    HashCodeService hashCodeService = new HashCodeService();
                    String hashCode = hashCodeService.createRoomBookingCancelCode(bookingID, roomBooking.Email);
                    mailService.toAddress = roomBooking.Email;
                    //ND mail gui cho khach hang:
                    mailService.body = "CANCEL ROOM BOOKING INFORMATION\n" + "CustomerName: " + roomBooking.Name + "\n" 
						+"ID: " + roomBooking.RoomBookingID + "\n" + "CheckInDate: " + roomBooking.CheckinDate + "\n" 
						+ "CheckOutDate: " + roomBooking.CheckoutDate + "\n" + "Click here to cancel your booking: " 
						+ "http://localhost:8080/RoomBookings/DeleteRoomBooking/?id=" 
						+ roomBooking.RoomBookingID + "&hash=" + hashCode;
                    mailService.subject = "CANCEL ROOM BOOKING INFORMATION";
                    mailService.sendMail();
                    return Json(new { Status = true }, JsonRequestBehavior.AllowGet);
                }
            }
            catch
            {
                return Json(new { Status = false }, JsonRequestBehavior.AllowGet);
            }

        }

        //GET: RoomBookings/DeleteRoomBooking
        public ActionResult DeleteRoomBooking(int id, string hash)
        {

			RoomBooking roomBooking = db.RoomBookings.Where(x => x.RoomBookingID == id).SingleOrDefault();
            if (roomBooking != null)
            {
                HashCodeService hashCodeService = new HashCodeService();
                hash = hash.Replace(' ', '+');
                String hashCode = hashCodeService.createRoomBookingCancelCode(id, roomBooking.Email);
      
                if (hash.Equals(hashCode))
                {
                    roomBooking.Status = "Canceled";
                    db.Entry(roomBooking).State = EntityState.Modified;
                    db.SaveChanges();
					return RedirectToAction("Search", "Home");
					
				}
            }

            return RedirectToAction("Index", "Home");
        }

        // GET: RoomBookings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomBooking roomBooking = db.RoomBookings.Find(id);
            if (roomBooking == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerID = new SelectList(db.CustomerTVs, "CustomerID", "Name", roomBooking.CustomerID);
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name", roomBooking.EmployeeID);
            return View(roomBooking);
        }

        // POST: RoomBookings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RoomBookingID,CustomerID,Person,RoomID,Name,Phone,Email,CheckinDate,CheckoutDate,EmployeeID")] RoomBooking roomBooking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomBooking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerID = new SelectList(db.CustomerTVs, "CustomerID", "Name", roomBooking.CustomerID);
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name", roomBooking.EmployeeID);
            return View(roomBooking);
        }

        // GET: RoomBookings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomBooking roomBooking = db.RoomBookings.Find(id);
            if (roomBooking == null)
            {
                return HttpNotFound();
            }
            return View(roomBooking);
        }

        // POST: RoomBookings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomBooking roomBooking = db.RoomBookings.Find(id);
            db.RoomBookings.Remove(roomBooking);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
