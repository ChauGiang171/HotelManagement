using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication.Entities;
using WebApplication.Utitlities;

namespace WebApplication.Controllers
{
    public class HomeController : Controller
    {
        private HotelManagementDAO db = new HotelManagementDAO();

        // GET: Home
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Search()
        {
            return View();
        }

        public ActionResult Account()
        {
            return View();
        }

        

        [HttpPost]
        public ActionResult TimKiemTheoLoaiPhong(int roomType, int sortType)
        {
      
            List<Room> listPhong = new List<Room>();
            if (sortType.Equals(SortTypeUtilites.DESC))
            {
                if (roomType.Equals(RoomTypeUtilities.SINGLE_ROOM)||roomType.Equals(RoomTypeUtilities.DOUBLE_ROOM))
                {
                    listPhong = db.Rooms.Where(x => x.RoomType.TypeID.Equals(roomType) && x.StatusID.Equals(RoomStatusUtilities.FREE)).OrderByDescending(x => x.RentalPrice).ToList();
                }
                else
                {

                    listPhong = db.Rooms.Where(x => x.StatusID.Equals(RoomStatusUtilities.FREE)).OrderByDescending(x => x.RentalPrice).ToList();
                }
            }
            // ASC
            else
            {
                if (roomType.Equals(RoomTypeUtilities.SINGLE_ROOM) || roomType.Equals(RoomTypeUtilities.DOUBLE_ROOM))
                {
                    listPhong = db.Rooms.Where(x => x.RoomType.TypeID.Equals(roomType) && x.StatusID.Equals(RoomStatusUtilities.FREE)).OrderBy(x => x.RentalPrice).ToList();
                }
                else
                {
                    listPhong = db.Rooms.Where(x => x.StatusID.Equals(RoomStatusUtilities.FREE)).OrderBy(x => x.RentalPrice).ToList();
                }
            }

            return PartialView(listPhong);
        }


        public ActionResult RoomCancel()
        {
            return View();
        }

    }
}