# This is the entry point of the application
print("Welcome to Package Express. Please follow the instructions below.")

# Prompt the user for the package weight
weight = float(input("Please enter the package weight: "))

# Check if the package weight is greater than 50
if weight > 50:
    # If the weight is too high, display an error message and exit
    print("Package too heavy to be shipped via Package Express. Have a good day.")
else:
    # Prompt the user for the package dimensions
    width = float(input("Please enter the package width: "))
    height = float(input("Please enter the package height: "))
    length = float(input("Please enter the package length: "))

    # Check if the total dimensions exceed 50
    if (width + height + length) > 50:
        # If the dimensions are too large, display an error message and exit
        print("Package too big to be shipped via Package Express.")
    else:
        # Calculate the volume of the package
        volume = width * height * length
        # Calculate the quote by multiplying the volume by the weight and dividing by 100
        quote = (volume * weight) / 100
        # Display the final shipping quote to the user
        print(f"Your estimated total for shipping this package is: ${quote:.2f}")
        print("Thank you!")
        