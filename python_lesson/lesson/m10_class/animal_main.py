from m10_class.animals import Cat, Dog, Horse


def test_run(animal):
    animal.run()
    animal.walk()


def main():
    dog = Dog()
    cat = Cat()
    horse = Horse()
    test_run(dog)
    test_run(cat)
    test_run(horse)


main()
