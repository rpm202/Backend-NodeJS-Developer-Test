const express = require("express");
const sequelize = require("./database/db");
const Booking = require("./models/Booking")
const Event = require("./models/Event")

const app = express();
app.use(express.json());



Booking.belongsTo(Event, { foreignKey: "events_id", onDelete: "CASCADE" });
Event.hasMany(Booking, { foreignKey: "events_id", onDelete: "CASCADE" });

(async () => {
    try {
        await sequelize.authenticate();
        console.log("MySQL connection established");

        await sequelize.sync({ alter: true })
        console.log("Tables synchronized");
    } catch (err) {
        console.error("Database connection error:", err);
    }
})();

app.post("/api/bookings/reserve", async (req, res) => {
    const { events_id, user_id } = req.body;

    if (!events_id || !user_id) {
        return res.status(400).json({ detail: "Missing events_id or user_id" });
    }
    try {
        const event = await Event.findByPk(events_id)
        if (!event) {
            return res.status(404).json({ detail: "Event not found" })
        }

        const exsisting = await Booking.findOne({
            where: { events_id: events_id, user_id },
        });
        if (!exsisting) {
            return res.status(400).json({ detail: "User already booking this event" });
        }

        const bookedCount = await Booking.count({ where: { events_id: events_id } });
        if (bookedCount >= event.total_seats) {
            return res.status(400).json({ detail: "No seats available" });
        }

        const booking = await Booking.create({ events_id: events_id, user_id });

        return res.json({
            message: "Booking successful",
            bookingId: booking.id,
        });

    } catch (err) {
        console.error("Error:", err);
        return res.status(500).json({ detail: "Server error" });
    }
});

app.get("/api/bookings/first10", async (req, res) => {
    try {
        const firstTenBookings = await Booking.findAll({
            limit: 10,
            order: [["created_at", "ASC"]],
            attributes: ["user_id", "events_id", "created_at"],
            include: [
                {
                    model: Event,
                    attributes: ["name"],
                },
            ],
        });

        return res.json(firstTenBookings);
    } catch (err) {
        console.error("Error:", err);
        return res.status(500).json({ detail: "Server error" });
    }
});

const PORT = 3000;
app.listen(PORT, () => console.log(`🚀 Server running on http://localhost:${PORT}`));
