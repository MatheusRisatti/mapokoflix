using System.ComponentModel.DataAnnotations;

namespace MapokoFlix.Models;
    public class Genre
    {
        [Key]
        public byte Id { get; set; }

        [Required]
        [StringLength(30)]
        public string Name { get; set; }
    }
