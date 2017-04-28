window.addEventListener("turbolinks:load", () => {
    const publics = [...document.getElementsByClassName("vk_public")]
    publics.map(elem => {
        VK.Widgets.Group(elem.id, {mode: 4, width: "320", height: "400"}, elem.id.split('_').pop())
    })
})
