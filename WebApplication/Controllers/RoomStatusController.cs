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
    public class RoomStatusController : Controller
    {
        private HotelManagementDAO db = new HotelManagementDAO();

        // GET: RoomStatus
        public ActionResult Index()
        {
            return View(db.RoomStatus.ToList());
        }

        // GET: RoomStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomStatu roomStatu = db.RoomStatus.Find(id);
            if (roomStatu == null)
            {
                return HttpNotFound();
            }
            return View(roomStatu);
        }

        // GET: RoomStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RoomStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StatusID,Name")] RoomStatu roomStatu)
        {
            if (ModelState.IsValid)
            {
                db.RoomStatus.Add(roomStatu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(roomStatu);
        }

        // GET: RoomStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomStatu roomStatu = db.RoomStatus.Find(id);
            if (roomStatu == null)
            {
                return HttpNotFound();
            }
            return View(roomStatu);
        }

        // POST: RoomStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StatusID,Name")] RoomStatu roomStatu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomStatu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(roomStatu);
        }

        // GET: RoomStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomStatu roomStatu = db.RoomStatus.Find(id);
            if (roomStatu == null)
            {
                return HttpNotFound();
            }
            return View(roomStatu);
        }

        // POST: RoomStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomStatu roomStatu = db.RoomStatus.Find(id);
            db.RoomStatus.Remove(roomStatu);
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
