$(function () {
    $(".action_close").click(function () {
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        return
    });
    $(".action_cash").click(function () {
        $.post(`https://${GetParentResourceName()}/cash`, JSON.stringify({}));
        return
    });
    $(".action_gold").click(function () {
        $.post(`https://${GetParentResourceName()}/gold`, JSON.stringify({}));
        return
    });
    $(".action_id").click(function () {
        $.post(`https://${GetParentResourceName()}/id`, JSON.stringify({}));
        return
    });
    $(".action_bandana").click(function () {
        $.post(`https://${GetParentResourceName()}/bandana`, JSON.stringify({}));
        return
    });
    $(".action_handsup").click(function () {
        $.post(`https://${GetParentResourceName()}/handsup`, JSON.stringify({}));
        return
    });
    $(".action_coords").click(function () {
        $.post(`https://${GetParentResourceName()}/coords`, JSON.stringify({}));
        return
    });
    $(".action_inventory").click(function () {
        $.post(`https://${GetParentResourceName()}/inventory`, JSON.stringify({}));
        return
    });
});