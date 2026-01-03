#!/bin/bash
# Restaurant Management System with Zenity

# Welcome message
zenity --info --title="Welcome to Foodie Delight" \
    --text="Experience the best food at affordable prices. Enjoy your visit!" \
    --width=400

# Menu items (prices in INR, adjusted for Indian market)
declare -A menu
menu=(
    ["Pizza"]="250"
    ["Burger"]="100"
    ["Pasta"]="200"
    ["Fries"]="80"
    ["Coke"]="50"
)

# Order storage
declare -A order
total_bill=0
total_items_sold=0
declare -A sales_report

# Function to display the menu
function display_menu {
    choice=$(zenity --list --title="Foodie Delight - Main Menu" \
        --column="Option" --column="Description" \
        1 "View Menu" \
        2 "Place an Order" \
        3 "View Bill" \
        4 "Update Menu" \
        5 "Clear Orders" \
        6 "View Sales Report" \
        7 "Pay Bill" \
        8 "Exit" \
        --cancel-label="Cancel" \
        --height=400 --width=400)

    if [[ -z "$choice" ]]; then
        return "back"
    fi
}

# Function to pause and confirm before returning to menu
function pause_and_confirm {
    zenity --info --title="Confirmation" --text="Click OK to return to the main menu." --width=300
}

# Function to display the food menu
function view_menu {
    menu_items=""
    for item in "${!menu[@]}"; do
        menu_items+="$item - Rs.${menu[$item]}\n"
    done
    zenity --info --title="Menu" --text="$menu_items" --width=300 || return "back"
    pause_and_confirm
}

# Function to place an order
function place_order {
    while true; do
        item=$(zenity --entry --title="Place Order" --text="Enter the item you want to order (type 'done' to finish):" --width=300 --cancel-label="Cancel")
        if [[ -z "$item" || "$item" == "done" ]]; then
            break
        fi
        if [[ -v menu["$item"] ]]; then
            quantity=$(zenity --entry --title="Order Quantity" --text="Enter quantity for $item:" --width=300 --cancel-label="Cancel")
            if [[ -z "$quantity" || ! "$quantity" =~ ^[0-9]+$ ]]; then
                zenity --error --text="Invalid quantity. Please enter a valid number." --width=300
                continue
            fi
            order["$item"]=$((order["$item"] + quantity))
            total_bill=$((total_bill + menu["$item"] * quantity))
            zenity --info --text="$quantity x $item added to your order." --width=300
        else
            zenity --error --text="Item not available. Please choose from the menu." --width=300
        fi
    done
    pause_and_confirm
}

# Function to view the bill
function view_bill {
    bill_text=""
    if [[ ${#order[@]} -eq 0 ]]; then
        bill_text="No items ordered."
    else
        for item in "${!order[@]}"; do
            quantity=${order["$item"]}
            cost=$((menu["$item"] * quantity))
            bill_text+="$item x $quantity = Rs.${cost}\n"
        done
        bill_text+="----------------------------------------\nTotal Bill: Rs.${total_bill}"
    fi
    zenity --info --title="Bill" --text="$bill_text" --width=300 || return "back"
    pause_and_confirm
}

# Function to update the menu
function update_menu {
    action=$(zenity --list --title="Update Menu" \
        --column="Option" --column="Description" \
        1 "Add Item" \
        2 "Remove Item" \
        --cancel-label="Cancel" \
        --height=200 --width=300)

    if [[ -z "$action" ]]; then
        return "back"
    fi

    case $action in
        1)
            new_item=$(zenity --entry --title="Add Item" --text="Enter the name of the new item:" --width=300 --cancel-label="Cancel")
            if [[ -z "$new_item" ]]; then
                return "back"
            fi
            new_price=$(zenity --entry --title="Add Item Price" --text="Enter the price for $new_item (in INR):" --width=300 --cancel-label="Cancel")
            if [[ -z "$new_price" || ! "$new_price" =~ ^[0-9]+$ ]]; then
                zenity --error --text="Invalid price. Please enter a valid number." --width=300
                return
            fi
            menu["$new_item"]=$new_price
            zenity --info --text="$new_item added to the menu with price Rs.${new_price}." --width=300
            ;;
        2)
            remove_item=$(zenity --entry --title="Remove Item" --text="Enter the name of the item to remove:" --width=300 --cancel-label="Cancel")
            if [[ -z "$remove_item" ]]; then
                return "back"
            fi
            if [[ -v menu["$remove_item"] ]]; then
                unset menu["$remove_item"]
                zenity --info --text="$remove_item removed from the menu." --width=300
            else
                zenity --error --text="Item not found in the menu." --width=300
            fi
            ;;
        *)
            zenity --error --text="Invalid option selected." --width=300
            ;;
    esac
    pause_and_confirm
}

# Function to clear all orders
function clear_orders {
    order=()
    total_bill=0
    zenity --info --text="All orders cleared." --width=300 || return "back"
    pause_and_confirm
}

# Function to view the sales report
function view_sales_report {
    report_text="Sales Report\n\n"
    report_text+="Item\tQuantity Sold\n"
    report_text+="----------------------------------------\n"
    for item in "${!sales_report[@]}"; do
        report_text+="$item\t${sales_report["$item"]}\n"
    done
    report_text+="----------------------------------------\nTotal Items Sold: $total_items_sold"
    zenity --info --title="Sales Report" --text="$report_text" --width=400 || return "back"
    pause_and_confirm
}

# Function to process payment
function pay_bill {
    if [[ ${#order[@]} -eq 0 ]]; then
        zenity --info --text="No items to pay for." --width=300
        return "back"
    fi

    payment=$(zenity --list --title="Payment Method" \
        --column="Option" --column="Method" \
        1 "Cash" \
        2 "Card" \
        --cancel-label="Cancel" \
        --height=200 --width=300)

    if [[ -z "$payment" ]]; then
        return "back"
    fi

    case $payment in
        1)
            amount_given=$(zenity --entry --title="Cash Payment" --text="Enter the amount given by the customer:" --width=300 --cancel-label="Cancel")
            if [[ -z "$amount_given" || ! "$amount_given" =~ ^[0-9]+$ ]]; then
                zenity --error --text="Invalid amount. Please enter a valid number." --width=300
                return "back"
            fi
            if (( amount_given < total_bill )); then
                zenity --error --text="Insufficient amount provided. Please enter a valid amount." --width=300
                return "back"
            fi
            change=$((amount_given - total_bill))
            zenity --info --text="Payment of Rs.${total_bill} completed using Cash. Change to return: Rs.${change}." --width=300
            ;;
        2)
            card_number=$(zenity --entry --title="Card Payment" --text="Enter the card number:" --width=300 --cancel-label="Cancel")
            if [[ -z "$card_number" ]]; then
                zenity --error --text="Invalid card number. Please enter a valid number." --width=300
                return "back"
            fi
            zenity --info --text="Payment of Rs.${total_bill} completed using Card." --width=300
            ;;
        *)
            zenity --error --text="Invalid payment method." --width=300
            return "back"
            ;;
    esac

    for item in "${!order[@]}"; do
        sales_report["$item"]=$((sales_report["$item"] + order["$item"]))
    done

    total_items_sold=0
    for item in "${!sales_report[@]}"; do
        total_items_sold=$((total_items_sold + sales_report["$item"]))
    done

    order=()
    total_bill=0
    pause_and_confirm
}

# Main program loop
while true; do
    display_menu
    if [[ $? == "back" ]]; then
        continue
    fi

    case $choice in
        1)
            view_menu
            ;;
        2)
            place_order
            ;;
        3)
            view_bill
            ;;
        4)
            update_menu
            ;;
        5)
            clear_orders
            ;;
        6)
            view_sales_report
            ;;
        7)
            pay_bill
            ;;
        8)
            zenity --info --text="Thank you for visiting Foodie Delight! We hope to see you again soon!" --width=300
            exit 0
            ;;
        *)
            zenity --error --text="Invalid option. Please try again." --width=300
            ;;
    esac
done
# End of script
