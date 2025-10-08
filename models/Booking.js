const { DataTypes } = require("sequelize");
const sequelize = require("../database/db");


const Booking = sequelize.define("Booking", {
    id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
    user_id: { type: DataTypes.STRING, allowNull: false },
    events_id: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false, references: { model: "events", key: "id" }, field: "events_id" },
    created_at: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
}, {
    tableName: "bookings",
    timestamps: false,
});

module.exports = Booking;