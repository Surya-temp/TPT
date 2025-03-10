package flightBookingSystem;

import java.util.*;

public class Flight {
    private String flightName;
    private int availableSeats;
    private int ticketPrice;
    private Map<String, Passenger> bookings;
    private int bookingCounter;
    public static final int DYNAMIC_FARE=200;

    public Flight(String flightName, int availableSeats, int ticketPrice) {
        this.flightName = flightName;
        this.availableSeats = availableSeats;
        this.ticketPrice = ticketPrice;
        this.bookings = new HashMap<>();
        this.bookingCounter = 0;
    }

    // Book tickets for a flight
    public String bookTickets(String passengerName, int age, int seats) {
        if (seats <= availableSeats) {
            bookingCounter++;
            String bookingId = "T" + bookingCounter;
            Passenger passenger = new Passenger(bookingId, passengerName, age, seats);
            bookings.put(bookingId, passenger);
            availableSeats -= seats;
            ticketPrice += DYNAMIC_FARE * seats; // Update price logic can be customized
            return bookingId;
        } else {
            System.out.println("Booking failed: Not enough seats available.");
            return null;
        }
    }

    // Cancel booking
    public boolean cancelBooking(String bookingId) {
        Passenger passenger = bookings.get(bookingId);
        if (passenger != null) {
            int seats = passenger.getSeatsBooked();
            availableSeats += seats;
            ticketPrice -= 200 * seats;
            bookings.remove(bookingId);
            System.out.println("Booking canceled successfully. Refund issued for " + seats + " seats.");
            return true;
        } else {
            System.out.println("Cancellation failed: Booking ID not found.");
            return false;
        }
    }

    // Display flight details
    public void displayDetails() {
        System.out.println("Flight: " + flightName);
        System.out.println("Available Seats: " + availableSeats);
        System.out.println("Current Ticket Price: ₹" + ticketPrice);
    }

    // Print details of all passengers in the flight
    public void printDetails() {
        displayDetails();
        System.out.println("Passengers:");
        for (Passenger passenger : bookings.values()) {
            System.out.println(passenger);
        }
    }

    // Getter methods for the fields (optional)
    public String getFlightName() {
        return flightName;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public Map<String, Passenger> getBookings() {
        return bookings;
    }
}
