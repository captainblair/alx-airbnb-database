def first(n):
    num = 0
    while num < n:
        yield num
        num += 1

    """
    Geneators are iterators, but you can only iterate over them once.
    After they are exhausted, they cannot be restarted or reused.
    Specifically, this generator function yields numbers from 0 to n-1.
    Yields numbers from 0 to n-1.
    """
    
    def decorator(func):
        def wrapper(*args, **kwargs):
            print("Before calling the function.")
            result = func(*args, **kwargs)
            print("After calling the function.")
            return result
        return wrapper
    @decorator
    def say_hello(name):
        print(f"Hello, {name}!")
        print("This is a decorated function.")