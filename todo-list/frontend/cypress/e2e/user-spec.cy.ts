describe('User Creation Spec', () => {
    it("Create User", () => {
        cy.visit("http://localhost:5173/users");
        cy.get('[name="new-username"]').type("New User");
        cy.get('[type="submit"]').click();
    })
});

describe('User Deletion Spec', () => {
    it("Delete User", () => {
        cy.visit("http://localhost:5173/users");
        cy.get('[name="user-delete-button"]').click();
    });
});
