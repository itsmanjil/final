const User = require("../models/user");
const mongoose = require("mongoose");

// use the new name of the database
const url = "mongodb://localhost:27017/secondhandshop";
before(async () => {
  await mongoose.connect(url, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
    useFindAndModify: false,
  });
});

after(async () => {
  await mongoose.connection.close();
});

describe("User Schema testing", () => {
  // the code below is for insert testing
  it("Add user", () => {
    const user = {
      fullname: "Anmol23 Koirala",
      email: "anmol323@gmail.com",
      password: "anmol23",
      contactnum: "9467516994",
      address: "Jhapa",
    };

    return User.create(user).then((pro_ret) => {
      expect(pro_ret.email).toEqual("anmol323@gmail.com");
    });
  });

  //   //to delete single user
  //   it("to test the delete user by id", async () => {
  //     const status = await User.deleteOne({
  //       _id: Object("5e48154cbb135629216a4d2a"),
  //     });
  //     expect(status.ok).toBe(1);
  //   });

  //   //to delete all user
  //   it("to test the delete all user", async () => {
  //     const status = await User.deleteMany();
  //     expect(status.ok).toBe(1);
  //   });

  //   // to update user
  //   it("to test the user update", async () => {
  //     return User.findOneAndUpdate(
  //       { _id: Object("5e48154cbb135629216a4d2a") },
  //       { $set: { fullname: "Anmol Koirala" } }
  //     ).then((pp) => {
  //       expect(pp.fullname).toEqual("Anmol Koirala");
  //     });
  //   });

  //   // select all user
  //   it("to test the select all user ", async () => {
  //     const status = await User.find({});
  //     expect(status.length).toBeGreaterThan(0);
  //   });
  // });
});
