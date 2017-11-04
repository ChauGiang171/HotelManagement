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
    public class RoomServicesController : Controller
    {
        private HotelManagementDAO db = new HotelManagementDAO();

        // GET: RoomServices
        public ActionResult Index()
        {
            return View(db.RoomServices.ToList());
        }

        // GET: RoomServices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomService roomService = db.RoomServices.Find(id);
            if (roomService == null)
            {
                return HttpNotFound();
            }
            return View(roomService);
        }

        // GET: RoomServices/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RoomServices/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ServiceID,Name,Price")] RoomService roomService)
        {
            if (ModelState.IsValid)
            {
                db.RoomServices.Add(roomService);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(roomService);
        }

        // GET: RoomServices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomService roomService = db.RoomServices.Find(id);
            if (roomService == null)
            {
                return HttpNotFound();
            }
            return View(roomService);
        }

        // POST: RoomServices/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ServiceID,Name,Price")] RoomService roomService)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomService).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(roomService);
        }

        // GET: RoomServices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomService roomService = db.RoomServices.Find(id);
            if (roomService == null)
            {
                return HttpNotFound();
            }
            return View(roomService);
        }

        // POST: RoomServices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomService roomService = db.RoomServices.Find(id);
            db.RoomServices.Remove(roomService);
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
