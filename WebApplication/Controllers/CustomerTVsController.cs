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
    public class CustomerTVsController : Controller
    {
        private HotelManagementDAO db = new HotelManagementDAO();

        // GET: CustomerTVs
        public ActionResult Index()
        {
            return View(db.CustomerTVs.ToList());
        }

        //GET: Customer/{id}
        [HttpGet]
        public ActionResult GetCustomerById(int customerId)
        {
            CustomerTV customer = db.CustomerTVs.Where(x => x.CustomerID.Equals(customerId)).SingleOrDefault();
            bool status = false;
            if (!(customer == null))
            {
                status = true;
            }
            else
            {
                customer = new CustomerTV();
            }
            return Json(new { Status = status, CustomerId = customer.CustomerID, Name = customer.Name, Phone = customer.Phone, Email = customer.Email, Gender = customer.Gender }, JsonRequestBehavior.AllowGet);
        }

        // GET: CustomerTVs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerTV customerTV = db.CustomerTVs.Find(id);
            if (customerTV == null)
            {
                return HttpNotFound();
            }
            return View(customerTV);
        }

        // GET: CustomerTVs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CustomerTVs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerID,Name,Birthday,Phone,Email,Gender,CumilativePoint,Address")] CustomerTV customerTV)
        {
            if (ModelState.IsValid)
            {
                db.CustomerTVs.Add(customerTV);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(customerTV);
        }

        [HttpPost]
        public ActionResult CreateJSON( CustomerTV customerTV)
        {
            db.CustomerTVs.Add(customerTV);
            db.SaveChanges();
            return Json(new { status = true, customerID = customerTV.CustomerID }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult CreateJSON()
        {
            return RedirectToAction("create");
        }

        // GET: CustomerTVs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerTV customerTV = db.CustomerTVs.Find(id);
            if (customerTV == null)
            {
                return HttpNotFound();
            }
            return View(customerTV);
        }

        // POST: CustomerTVs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,Name,Birthday,Phone,Email,Gender,CumilativePoint,Address")] CustomerTV customerTV)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customerTV).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(customerTV);
        }

        // GET: CustomerTVs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerTV customerTV = db.CustomerTVs.Find(id);
            if (customerTV == null)
            {
                return HttpNotFound();
            }
            return View(customerTV);
        }

        // POST: CustomerTVs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CustomerTV customerTV = db.CustomerTVs.Find(id);
            db.CustomerTVs.Remove(customerTV);
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
