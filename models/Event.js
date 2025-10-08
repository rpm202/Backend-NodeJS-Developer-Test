const { DataTypes } = require("sequelize");
const sequelize = require("../database/db");

const Event = sequelize.define("Event", {
    id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
    total_seats: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
}, {
    tableName: "events",
    timestamps: false,
});

module.exports = Event;