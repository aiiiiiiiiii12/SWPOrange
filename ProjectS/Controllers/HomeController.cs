﻿using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Project.Data;
using Project.Models;
using Project.Service;
using System.Diagnostics;
namespace Project.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ShopContext _shopContext;

        public HomeController(ILogger<HomeController> logger, ShopContext ct)
        {
            _shopContext = ct;
            _logger = logger;
        }

        public IActionResult Index(string mode)
        {
            var listProduct = _shopContext.Products.Where(p => p.HomeStatus == true);
            if (mode != null)
            {
                if (mode.Equals("EDetailProduct"))
                {
                    ViewData["EDetailProduct"] = "Error";
                }
            }
            return View(listProduct.ToList());
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}