namespace WebApplication.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Room")]
    public partial class Room
    {
        [StringLength(20)]
        public string RoomID { get; set; }

        public int TypeID { get; set; }

        [Column(TypeName = "money")]
        public decimal RentalPrice { get; set; }

        public int StatusID { get; set; }

        [Required]
        public string Image { get; set; }

        public virtual RoomStatu RoomStatu { get; set; }

        public virtual RoomType RoomType { get; set; }
    }
}
