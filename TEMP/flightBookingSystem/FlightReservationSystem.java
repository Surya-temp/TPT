package flightBookingSystem;

import java.util.*;

public class FlightReservationSystem {
    private Map<String, Flight> flights;

    public Map<String, Flight> getFlights() {
		return flights;
	}

	public FlightReservationSystem() {
        flights = new HashMap<>();
        // Create some default flights
        flights.put("Indigo", new Flight("Indigo", 50, 5000));
        flights.put("SpiceJet", new Flight("SpiceJet", 50, 4500));
    }

    // Book a ticket
    public String bookTicket(String flightName, String passengerName, int age, int seats) {
        Flight flight = flights.get(flightName);
        if (flight == null) {
            System.out.println("Invalid flight name.");
            return null;
        }
        return flight.bookTickets(passengerName, age, seats);
    }

    // Cancel a booking
    public boolean cancelTicket(String flightName, String bookingId) {
        Flight flight = flights.get(flightName);
        if (flight == null) {
            System.out.println("Invalid flight name.");
            return false;
        }
        return flight.cancelBooking(bookingId);
    }

    // Display flight details
    public void printFlightDetails(String flightName) {
        Flight flight = flights.get(flightName);
        if (flight != null) {
            flight.printDetails();
        } else {
            System.out.println("Invalid flight name.");
        }
    }
}
