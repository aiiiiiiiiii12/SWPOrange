using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project.Data;
using Project.Models;

namespace Project.Controllers
{
    public class CommentController : Controller
    {
        private readonly ShopContext _shopContext;
        private readonly UserManager<IdentityUser> _userManager;

        public CommentController(ShopContext shopContext, UserManager<IdentityUser> userManager)
        {
            _shopContext = shopContext;
            _userManager = userManager;

        }
        public IActionResult AddComment(IFormCollection form)
        {
            if (ModelState.IsValid)
            {
                
                var userId = _userManager.GetUserId(HttpContext.User);
                if(userId == null)
                {
                    return Redirect("~/Identity/Account/Login");
                }
                var blogId = int.Parse(form["blogId"]);
                var content = form["content"];

                var comment = new Comment
                {
                    UserId = userId,
                    Blogid = blogId,
                    Content = content
                };
                _shopContext.Comment.Add(comment);
                _shopContext.SaveChanges();

                return RedirectToAction("BlogDetails", "Blog", new { blogId = blogId });


            }
            else
            {
                return NotFound();

            }
        }

        public IActionResult AddAnswer(IFormCollection form)
        {
            if (ModelState.IsValid)
            {

                var userId = _userManager.GetUserId(HttpContext.User);
                if (userId == null)
                {
                    return Redirect("~/Identity/Account/Login");
                }
                var commentId = int.Parse(form["commentId"]);
                var content = form["content"];
                var blogId = int.Parse(form["blogId"]);

                var answer = new Answer
                {
                    UserId = userId,
                    commentId = commentId,
                    content = content
                };
                _shopContext.Add(answer);
                _shopContext.SaveChanges();

                return RedirectToAction("BlogDetails", "Blog", new { blogId = blogId });


            }
            else
            {
                return NotFound();

            }
        }
    }
}
