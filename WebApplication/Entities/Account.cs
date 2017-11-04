namespace WebApplication.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Account")]
    public partial class Account
    {
        [Required]
        [StringLength(100)]
        public string Username { get; set; }

        [Key]
        [StringLength(10)]
        public string EmployeeID { get; set; }

        [Required]
        [StringLength(100)]
        public string Password { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
