using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication.Entities;

namespace WebApplication.Controllers
{
    public class RoomBookingServicesController : Controller
    {
        private HotelManagementDAO db = new HotelManagementDAO();

        // GET: RoomBookingServices
        public ActionResult Index()
        {
            var roomBookingServices = db.RoomBookingServices.Include(r => r.RoomBooking).Include(r => r.RoomService);
            return View(roomBookingServices.ToList());
        }

        // GET: RoomBookingServices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomBookingService roomBookingService = db.RoomBookingServices.Find(id);
            if (roomBookingService == null)
            {
                return HttpNotFound();
            }
            return View(roomBookingService);
        }

        // GET: RoomBookingServices/Create
        public ActionResult Create()
        {
            ViewBag.RoomBookingID = new SelectList(db.RoomBookings, "RoomBookingID", "RoomID");
            ViewBag.ServiceID = new SelectList(db.RoomServices, "ServiceID", "Name");
            return View();
        }

        // POST: RoomBookingServices/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RoomBookingID,ServiceID,OderDate")] RoomBookingService roomBookingService)
        {
            if (ModelState.IsValid)
            {
                db.RoomBookingServices.Add(roomBookingService);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.RoomBookingID = new SelectList(db.RoomBookings, "RoomBookingID", "RoomID", roomBookingService.RoomBookingID);
            ViewBag.ServiceID = new SelectList(db.RoomServices, "ServiceID", "Name", roomBookingService.ServiceID);
            return View(roomBookingService);
        }

        // GET: RoomBookingServices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomBookingService roomBookingService = db.RoomBookingServices.Find(id);
            if (roomBookingService == null)
            {
                return HttpNotFound();
            }
            ViewBag.RoomBookingID = new SelectList(db.RoomBookings, "RoomBookingID", "RoomID", roomBookingService.RoomBookingID);
            ViewBag.ServiceID = new SelectList(db.RoomServices, "ServiceID", "Name", roomBookingService.ServiceID);
            return View(roomBookingService);
        }

        // POST: RoomBookingServices/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RoomBookingID,ServiceID,OderDate")] RoomBookingService roomBookingService)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomBookingService).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.RoomBookingID = new SelectList(db.RoomBookings, "RoomBookingID", "RoomID", roomBookingService.RoomBookingID);
            ViewBag.ServiceID = new SelectList(db.RoomServices, "ServiceID", "Name", roomBookingService.ServiceID);
            return View(roomBookingService);
        }

        // GET: RoomBookingServices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomBookingService roomBookingService = db.RoomBookingServices.Find(id);
            if (roomBookingService == null)
            {
                return HttpNotFound();
            }
            return View(roomBookingService);
        }

        // POST: RoomBookingServices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomBookingService roomBookingService = db.RoomBookingServices.Find(id);
            db.RoomBookingServices.Remove(roomBookingService);
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
