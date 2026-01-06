describe('User Creation Spec', () => {
    it("Creates User", () => {
        cy.visit("http://localhost:5173/users");
        cy.get('[name="new-username"]').type("New User");
        cy.get('[type="submit"]').click();
        cy.get('ul').should("have.length", 1);
        cy.contains("New User");
    });
    it("Deletes User", () => {
        cy.visit("http://localhost:5173/users");
        cy.get('[name="user-delete-button"]').click();
        cy.get('ul').should("have.length", 0);
    });
});
