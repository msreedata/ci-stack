using SampleWebApiAspNetCore.Entities;
using SampleWebApiAspNetCore.Repositories;
using System;

namespace SampleWebApiAspNetCore.Services
{
    public class SeedDataService : ISeedDataService
    {
        IFoodRepository _repository;

        public SeedDataService(IFoodRepository repository)
        {
            _repository = repository;
        }

        public void EnsureSeedData()
        {
            _repository.Add(new FoodItem() { Calories = 72, Id = 1, Name = "Apple", Created = DateTime.Now });
            _repository.Add(new FoodItem() { Calories = 105, Id = 2, Name = "Banana", Created = DateTime.Now });
            _repository.Add(new FoodItem() { Calories = 102, Id = 3, Name = "Egg", Created = DateTime.Now });
            _repository.Add(new FoodItem() { Calories = 221, Id = 4, Name = "Spaghetti", Created = DateTime.Now });
        }
    }
}
