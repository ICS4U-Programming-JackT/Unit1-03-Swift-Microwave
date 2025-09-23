import Foundation

// Cooking time constants (in minutes)
let TimeSub: Double = 1.0
let TimePizza: Double = 0.75
let TimeSoup: Double = 1.75

// Error cases for invalid inputs
enum DataError: Error {
    case invalidInput
    case invalidFood
    case invalidAmount
}

// Main program function
func main() {
    // Ask user for food type
    print("Are you heating a Sub, Pizza or Soup?:")
    
    if let food = readLine() {
        // Ask user for number of items
        print("How many \(food)(s) are you cooking? (max: 3):")
        
        if let amount = readLine() {
            do {
                // Try converting amount to a number
                guard let amountDouble = Double(amount) else {
                    throw DataError.invalidInput
                }
                
                // Validate food type
                if !(food == "Sub" || food == "Pizza" || food == "Soup") {
                    throw DataError.invalidFood
                }
                
                // Validate amount
                if !(amountDouble == 1 || amountDouble == 2 || amountDouble == 3) {
                    throw DataError.invalidAmount
                }
                
                // Multiplier calculation
                let amountMultiplier = (0.5 * amountDouble) + 0.5
                
                // Assign base cooking time
                var foodTime = 0.0
                if food == "Sub" {
                    foodTime = TimeSub
                } else if food == "Pizza" {
                    foodTime = TimePizza
                } else if food == "Soup" {
                    foodTime = TimeSoup
                }
                
                // Final cooking time
                let timeToCook = foodTime * amountMultiplier
                let minutes = floor(timeToCook)
                let seconds = (timeToCook - minutes) * 60
                
                // Output result
                print("It will take \(Int(minutes)) minutes and "
                    + "\(Int(seconds)) seconds to cook "
                    + "\(amount) \(food)(s).")
                
            } catch DataError.invalidInput {
                print("Error: Please enter a valid number for amount (1, 2, or 3).")
            } catch DataError.invalidFood {
                print("Error: Please enter a valid food (Sub, Pizza, or Soup).")
            } catch DataError.invalidAmount {
                print("Error: Please enter 1, 2, or 3 items to heat.")
            } catch {
                print("An unexpected error occurred: \(error)")
            }
        } else {
            print("Error: Could not read amount input.")
        }
    } else {
        print("Error: Could not read food input.")
    }
}

// Run the program
main()
